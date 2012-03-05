function [fMask] = vbq_prep_pd_mask(fPDw, spec)
    v = spm_vol(fPDw);
    dat = spm_read_vols(v);
    dat = dat(1:2:size(dat,1),1:2:size(dat,2),1:2:size(dat,3));
    r = max(max(max(dat))) - min(min(min(dat)));
    t = min(min(min(dat))) + spec.pdmask_thresh * r;
    dat = (dat >= t);
    for e = spec.pdmask_erosions
        if e > 0
            dat = ls_imerode(dat, ls_strel('sphere', e));
        end
    end
    cc = ls_bwconncomp(dat, 8);
    a = 0;
    b = 0;
    for i=1:numel(cc.PixelIdxList)
        if numel(cc.PixelIdxList{i}) > b
            a = i;
            b = numel(cc.PixelIdxList{i});
        end
    end
    dat = zeros(size(dat,1), size(dat,2), size(dat,3));
    dat(cc.PixelIdxList{a}) = 1;
    for d = spec.pdmask_dilations
        if d > 0
            dat = ls_imdilate(dat, ls_strel('sphere', e));
        end
    end
    [path, name, ext] = fileparts(fPDw);
    dat = ls_imresize(dat, v.dim);
    fMask = fullfile(path, [name '_mask' ext]);
    v.fname = fMask;
    spm_write_vol(v, dat);
end