function job=vbq_auto_pipeline(job)
    if ~isfield(job.auto_pipeline, 'auto_pipeline_yes')
        return
    end

    D = char(job.auto_pipeline.auto_pipeline_yes.auto_pipeline_dir);
    U = job.auto_pipeline.auto_pipeline_yes.auto_pipeline_unpack;
    files = list_files_rec(D);
    
    if U
        for i=1:numel(files)
            if ~isempty(regexp(files{i}, '.tar$', 'match'))
                untar(files{i}, fileparts(files{i}));
                spm_unlink(files{i});
            end
        end
        files = list_files_rec(D);
    end
    
    hdr = spm_dicom_headers(char(files), 1);
    cd(D);
    spm_dicom_convert(hdr, 'all', 'patid_date', 'nii');
    for i=1:numel(hdr)
        spm_unlink(hdr{i}.Filename)
    end
    
    remove_empty_dir(D);
    
    subj_count = 0;
    subj_orig = job.subj(1);
    pat = dir(D);
    for i=3:numel(pat)
        subj = subj_orig;
        stud = dir(fullfile(D, pat(i).name));
        for k=3:numel(stud)
            P = fullfile(D, pat(i).name, stud(k).name);
            seq = dir(P);
            seq_names = {seq.name};
            
            subj.raw_mpm.MT = list_files_rec(multi_fullfile(P, find_str(seq_names, job.auto_pipeline.auto_pipeline_yes.auto_pipeline_mt)));
            subj.raw_mpm.PD = list_files_rec(multi_fullfile(P, find_str(seq_names, job.auto_pipeline.auto_pipeline_yes.auto_pipeline_pd)));
            subj.raw_mpm.T1 = list_files_rec(multi_fullfile(P, find_str(seq_names, job.auto_pipeline.auto_pipeline_yes.auto_pipeline_t1)));
            
            if isfield(subj, 'raw_fld')
                subj.raw_fld.b1 = list_files_rec(multi_fullfile(P, find_str(seq_names, job.auto_pipeline.auto_pipeline_yes.auto_pipeline_b1)));
                subj.raw_fld.b0 = list_files_rec(multi_fullfile(P, find_str(seq_names, job.auto_pipeline.auto_pipeline_yes.auto_pipeline_b0)));
            end
        end
        subj_count = subj_count + 1;
        job.subj(subj_count) = subj;
    end
    
    function F = list_files_rec(D)
        F = {};
        if iscell(D) && numel(D)>1
            for j=1:numel(D)
                F = [F; list_files_rec(D{j})]; %#ok<AGROW>
            end
            return
        end
        D = char(D);
        x = dir(D);
        count = 0;
        for j=3:numel(x)
            if ~x(j).isdir
                count = count + 1;
                F{count} = fullfile(D, x(j).name); %#ok<AGROW>
            end
        end
        for j=3:numel(x)
            if x(j).isdir
                F = [F; list_files_rec(fullfile(D, x(j).name))]; %#ok<AGROW>
            end
        end
    end

    function remove_empty_dir(D)
        D = char(D);
        x = dir(D);
        for j=3:numel(x)
            if x(j).isdir
                remove_empty_dir(fullfile(D, x(j).name));
            end
        end
        try
            rmdir(D)
        catch e %#ok<NASGU>
            % leave alone non-empty directories
        end
    end

    function S = find_str(A, R)
        R = char(R);
        S = {};
        count = 0;
        for j=1:numel(A)
            if ~isempty(regexp(A{j}, R, 'match'))
                count = count + 1;
                S{count} = A{j}; %#ok<AGROW>
            end
        end
    end

    function M = multi_fullfile(P, F)
        M = {};
        for j=1:numel(F)
            M{j} = fullfile(P, F{j}); %#ok<AGROW>
        end
    end
end
