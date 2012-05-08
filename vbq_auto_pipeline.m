function job=vbq_auto_pipeline(job)
    if ~isfield(job.auto_pipeline, 'auto_pipeline_yes')
        return
    end
    
    javaclasspath(fullfile(spm('dir'), 'toolbox', 'vbq', 'Dicomymizer.jar'));

    D = char(job.auto_pipeline.auto_pipeline_yes.auto_pipeline_dir);
    U = job.auto_pipeline.auto_pipeline_yes.auto_pipeline_unpack;
    H = job.auto_pipeline.auto_pipeline_yes.auto_pipeline_hierarchy;
    
    if U
        files = list_files_rec(D);
        for i=1:numel(files)
            if ~isempty(regexp(files{i}, '.tar$', 'match'))
                untar(files{i}, fileparts(files{i}));
                spm_unlink(files{i});
            end
        end
    end
    
    if H
        files = list_files_rec(D);
        f = fopen(fullfile(D, 'vbq_files.txt'), 'w');
        for i=1:numel(files)
            fwrite(f, [files{i} '\n']);
        end
        fclose(f);
        args = {};
        args{1} = fullfile(spm('dir'), 'toolbox', 'vbq', 'attr.txt');
        args{2} = fullfile(spm('dir'), 'toolbox', 'vbq', 'hier.txt');
        args{3} = D;
        args{4} = '1';
        args{5} = fullfile(D, 'vbq_files.txt');
        anon = ch.chuv.dicomymizer.Anonymizer();
        anon.main(args);
        % hdr = spm_dicom_headers(char(files), 1);
        % cd(D);
        % spm_dicom_convert(hdr, 'all', 'patid_date', 'nii');
        % for i=1:numel(hdr)
            % spm_unlink(hdr{i}.Filename)
        % end
        
        remove_empty_dir(D);
    end
    
    subj_count = 0;
    subj_orig = job.subj(1);
    pat = dir(D);
    for i=3:numel(pat)
        subj = subj_orig;
        stud = dir(fullfile(D, pat(i).name));
        for k=3:numel(stud)
            P = fullfile(D, pat(i).name, stud(k).name);
            seq = dir(P);
            
            for m=3:numel(seq)
                P2 = fullfile(P, seq(m).name);
                ser = dir(P2);
                for n=3:numel(ser)
                    P3 = fullfile(P2, ser(n).name);
                    
                    mosaic_result = '';
                    if job.auto_pipeline.auto_pipeline_yes.auto_pipeline_mosaic
                        mosaic_result = process_mosaic(P3);
                    end
                            
                    if isempty(mosaic_result)
                        hdr = spm_dicom_headers(char(list_files_rec(P3)), 1);
                        old_dir = pwd;
                        cd(P3);
                        spm_dicom_convert(hdr, 'all', 'flat', 'nii');
                        cd(old_dir);
                        for o=1:numel(hdr)
                            spm_unlink(hdr{o}.Filename);
                        end
                    end
                end
            end
            
            seq_names = {seq.name};
            
            subj.raw_mpm.MT = list_files_rec(multi_fullfile(P, find_str(seq_names, job.auto_pipeline.auto_pipeline_yes.auto_pipeline_mt)), 1);
            subj.raw_mpm.PD = list_files_rec(multi_fullfile(P, find_str(seq_names, job.auto_pipeline.auto_pipeline_yes.auto_pipeline_pd)), 1);
            subj.raw_mpm.T1 = list_files_rec(multi_fullfile(P, find_str(seq_names, job.auto_pipeline.auto_pipeline_yes.auto_pipeline_t1)), 1);
            
            if isfield(subj, 'raw_fld')
                subj.raw_fld.b1 = list_files_rec(multi_fullfile(P, find_str(seq_names, job.auto_pipeline.auto_pipeline_yes.auto_pipeline_b1)));
                subj.raw_fld.b0 = list_files_rec(multi_fullfile(P, find_str(seq_names, job.auto_pipeline.auto_pipeline_yes.auto_pipeline_b0)));
            end
        end
        
        if ~isempty(subj.raw_mpm.MT) && ~isempty(subj.raw_mpm.PD) && ~isempty(subj.raw_mpm.T1) && (~isfield(subj, 'raw_fld') || (~isempty(subj.raw_fld.b1) && ~isempty(subj.raw_fld.b0)))        
            subj_count = subj_count + 1;
            job.subj(subj_count) = subj;
        else
            disp(['Missing images for ' pat(i).name]);
        end
    end
    
    function F = list_files_rec(D, num_dir)
        if ~exist('num_dir', 'var')
            num_dir = Inf;
        end
        cnt_dir = num_dir;
        F = {};
        if iscell(D) && numel(D)>1
            for j=1:numel(D)
                F = [F; list_files_rec(D{j}, num_dir)]; %#ok<AGROW>
            end
            return
        end
        D = char(D);
        x = dir(D);
        [~, idx] = sort({x.name});
        x=x(idx);
        count = 0;
        for j=3:numel(x)
            if ~x(j).isdir
                count = count + 1;
                F{count,1} = fullfile(D, x(j).name); %#ok<AGROW>
            end
        end
        for j=3:numel(x)
            if x(j).isdir && cnt_dir>0
                cnt_dir = cnt_dir - 1;
                F = [F; list_files_rec(fullfile(D, x(j).name), num_dir)]; %#ok<AGROW>
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
        S=sort(S);
        if ~isempty(S)
            S=S{1};
        else
            S='null';
        end
    end

    function M = multi_fullfile(P, F)
        M = {};
        if ~iscell(F)
            F = {F};
        end
        for j=1:numel(F)
            M{j} = fullfile(P, F{j}); %#ok<AGROW>
        end
    end

    function res = process_mosaic(path)
        res = GetImgFromMosaic(path);
        x=dir(fullfile(path, 'Echo*'));
        oldwd = pwd;
        cd(path);
        for j=1:size(x,1)
            y = dir(fullfile(path, x(j).name));
            hdrs = spm_dicom_headers(char(y(3:end).name));
            spm_dicom_convert(hdrs, 'all', 'flat', 'nii');
            for o1=1:numel(hdrs)
                spm_unlink(hdrs{o1}.Filename);
            end
        end
        cd(oldwd);
    end
end
