function [fMask] = vbq_prep_pd_mask(fPDw, spec)
    if exist('imdilate', 'file') == 2
        vbq_imdilate = @imdilate;
        vbq_imerode = @imerode;
    elseif exist('ls_imdilate', 'file') == 2
        vbq_imdilate = @ls_imdilate;
        vbq_imerode = @ls_imerode;
    elseif exist('spm_dilate', 'file') == 2
        vbq_imdilate = @(ima, krn) spm_dilate(double(ima), double(krn));
        vbq_imerode = @(ima, krn) spm_erode(double(ima), double(krn));
    else
        error('No implementation of morphological dilation/erosion is available!');
    end
    
    if exist('bwconncomp', 'file') == 2
        vbq_bwconncomp = @bwconncomp;
    elseif exist('ls_bwconncomp', 'file') == 2
        vbq_bwconncomp = @ls_bwconncomp;
    else
        error('No implementation of bwconncomp is available!');
    end
        
    v = spm_vol(fPDw);
    dat = spm_read_vols(v);
    % dat = ls_imfilter(dat, fspecial3('gaussian', 3));
    range = max(max(max(dat))) - min(min(min(dat)));
    t = min(min(min(dat))) + spec.pdmask_thresh * range;
    dat = (dat >= t);
    for e = spec.pdmask_erosions
        if e > 0
            dat = vbq_imerode(dat, vbq_strel('sphere', e));
        end
    end
    cc = vbq_bwconncomp(dat, 18);
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
            dat = vbq_imdilate(dat, ones(d,d,d));
        end
    end
    cc = vbq_bwconncomp(1-dat, 18);
    for i=2:numel(cc.PixelIdxList)
        dat(cc.PixelIdxList{i})=1;
    end
    [path, name, ext] = fileparts(fPDw);
    fMask = fullfile(path, [name '_mask' ext]);
    v.fname = fMask;
    spm_write_vol(v, dat);
    
    function SE=vbq_strel(~, d)
        if (mod(d,2) == 0)
            r = d / 2;
            [xx,yy,zz] = ndgrid(-r:r,-r:r,-r:r);

            xx(xx > 0) = xx(xx > 0) - 0.5;
            xx(xx < 0) = xx(xx < 0) + 0.5;
            xx(r+1,:,:) = [];
            xx(:,1,:) = [];
            xx(:,:,1) = [];
            yy(:,r+1,:) = [];
            yy(1,:,:) = [];
            yy(:,:,1) = [];    
            zz(:,:,r+1) = [];
            zz(1,:,:) = [];
            zz(:,1,:) = []; 
        else
            r = (d - 1) /2;
            [xx,yy,zz] = ndgrid(-r:r,-r:r,-r:r);
        end

        SE = xx.^2 + yy.^2 + zz.^2 <= r^2;
    end
end