function vbq = tbx_cfg_vbq
% Configuration file for the Voxel-Based Quantification (VBQ)
%  
% Warning and disclaimer: This software is for research use only. 
% Do not use it for clinical or diagnostic purposes.
% 
%_______________________________________________________________________
%
% Bogdan Draganski & Ferath Kherif, 2011
% ======================================================================

% $Id: tbx_cfg_vbq.m 265 2011-08-01 10:58:48Z nikolaus $

if ~isdeployed, addpath(fullfile(spm('Dir'),'toolbox','VBQ')); end

% ---------------------------------------------------------------------
% auto_pipeline_no Automatic Pipeline Setup NO
% ---------------------------------------------------------------------
auto_pipeline_no  = cfg_const;
auto_pipeline_no.tag = 'auto_pipeline_no';
auto_pipeline_no.name = 'No';
auto_pipeline_no.help = {'Do NOT use automatic pipeline.'};
auto_pipeline_no.val = {0};
% ---------------------------------------------------------------------
% auto_pipeline_yes Automatic Pipeline Setup Dir
% ---------------------------------------------------------------------
auto_pipeline_dir         = cfg_files;
auto_pipeline_dir.tag     = 'auto_pipeline_dir';
auto_pipeline_dir.name    = 'Pipeline input directory';
auto_pipeline_dir.help    = {'Select a directory for automatic pipeline input.'};
auto_pipeline_dir.filter = 'dir';
auto_pipeline_dir.ufilter = '.*';
auto_pipeline_dir.num     = [1 1];
% ---------------------------------------------------------------------
% auto_pipeline_yes Automatic Pipeline Setup Unpack
% ---------------------------------------------------------------------
auto_pipeline_unpack         = cfg_menu;
auto_pipeline_unpack.tag     = 'auto_pipeline_unpack';
auto_pipeline_unpack.name    = 'Unpack .tar archives';
auto_pipeline_unpack.help    = {'If Yes is selected, .tar archives will be unpacked and deleted prior to listing DICOM files.'};
auto_pipeline_unpack.labels  = {
                'Yes'
                'No'
                }';
auto_pipeline_unpack.values = {
                1
                0
                }';
auto_pipeline_unpack.val    = {0};
% ---------------------------------------------------------------------
% auto_pipeline_yes Automatic Pipeline Setup MT
% ---------------------------------------------------------------------
auto_pipeline_mt = cfg_entry;
auto_pipeline_mt.tag = 'auto_pipeline_mt';
auto_pipeline_mt.name = 'MT sequence name (regular expression)';
auto_pipeline_mt.help = {'This regular expression will be used to identify MT sequences.'};
auto_pipeline_mt.strtype = 's';
auto_pipeline_mt.num = [1 Inf];
auto_pipeline_mt.val = {'mt_'};
% ---------------------------------------------------------------------
% auto_pipeline_yes Automatic Pipeline Setup PD
% ---------------------------------------------------------------------
auto_pipeline_pd = cfg_entry;
auto_pipeline_pd.tag = 'auto_pipeline_pd';
auto_pipeline_pd.name = 'PD sequence name (regular expression)';
auto_pipeline_pd.help = {'This regular expression will be used to identify PD sequences.'};
auto_pipeline_pd.strtype = 's';
auto_pipeline_pd.num = [1 Inf];
auto_pipeline_pd.val = {'pd_'};
% ---------------------------------------------------------------------
% auto_pipeline_yes Automatic Pipeline Setup T1
% ---------------------------------------------------------------------
auto_pipeline_t1 = cfg_entry;
auto_pipeline_t1.tag = 'auto_pipeline_t1';
auto_pipeline_t1.name = 'T1 sequence name (regular expression)';
auto_pipeline_t1.help = {'This regular expression will be used to identify T1 sequences.'};
auto_pipeline_t1.strtype = 's';
auto_pipeline_t1.num = [1 Inf];
auto_pipeline_t1.val = {'t1_'};
% ---------------------------------------------------------------------
% auto_pipeline_yes Automatic Pipeline Setup B0
% ---------------------------------------------------------------------
auto_pipeline_b0 = cfg_entry;
auto_pipeline_b0.tag = 'auto_pipeline_b0';
auto_pipeline_b0.name = 'B0 sequence name (regular expression)';
auto_pipeline_b0.help = {'This regular expression will be used to identify B0 sequences.'};
auto_pipeline_b0.strtype = 's';
auto_pipeline_b0.num = [1 Inf];
auto_pipeline_b0.val = {'field'};
% ---------------------------------------------------------------------
% auto_pipeline_yes Automatic Pipeline Setup B1
% ---------------------------------------------------------------------
auto_pipeline_b1 = cfg_entry;
auto_pipeline_b1.tag = 'auto_pipeline_b1';
auto_pipeline_b1.name = 'B1 sequence name (regular expression)';
auto_pipeline_b1.help = {'This regular expression will be used to identify B1 sequences.'};
auto_pipeline_b1.strtype = 's';
auto_pipeline_b1.num = [1 Inf];
auto_pipeline_b1.val = {'B1'};
% ---------------------------------------------------------------------
% auto_pipeline_hierarchy Automatic Pipeline Setup Unpack
% ---------------------------------------------------------------------
auto_pipeline_hierarchy         = cfg_menu;
auto_pipeline_hierarchy.tag     = 'auto_pipeline_hierarchy';
auto_pipeline_hierarchy.name    = 'Create PatientName/StudyDate/ProtocolName/ProtocolSeries hierarchy';
auto_pipeline_hierarchy.help    = {'If Yes is selected, the abovementioned hierarchy will be created.'};
auto_pipeline_hierarchy.labels  = {
                'Yes'
                'No'
                }';
auto_pipeline_hierarchy.values = {
                1
                0
                }';
auto_pipeline_hierarchy.val    = {0};
% ---------------------------------------------------------------------
% auto_pipeline_yes Automatic Pipeline Setup YES
% ---------------------------------------------------------------------
auto_pipeline_yes = cfg_branch;
auto_pipeline_yes.tag = 'auto_pipeline_yes';
auto_pipeline_yes.name = 'Yes';
auto_pipeline_yes.help = {'Use automatic pipeline.'};
auto_pipeline_yes.val = {auto_pipeline_dir auto_pipeline_unpack auto_pipeline_hierarchy auto_pipeline_mt auto_pipeline_pd auto_pipeline_t1 auto_pipeline_b0 auto_pipeline_b1};
% ---------------------------------------------------------------------
% auto_pipeline Automatic Pipeline Setup
% ---------------------------------------------------------------------
auto_pipeline          = cfg_choice;
auto_pipeline.tag      = 'auto_pipeline';
auto_pipeline.name     = 'Create subject entries automatically from DICOM files.';
auto_pipeline.help     = {'DICOM files in the selected directory will be listed recursively and appropriate job subject entries created automatically. Do NOT delete first subject, just leave the image input fields empty. This subject''s settings will be copied for all subjects.'};
auto_pipeline.values   = {auto_pipeline_yes auto_pipeline_no};
auto_pipeline.val      = {auto_pipeline_no};
% ---------------------------------------------------------------------
% raws Raw Images
% ---------------------------------------------------------------------
raws3           = cfg_files;
raws3.tag       = 'T1';
raws3.name      = 'T1 images';
raws3.help      = {'Input T1 images in the same order.'}; 
raws3.filter    = 'image';
raws3.ufilter   = '.*';
raws3.num       = [0 Inf];
raws3.val       = {''};
% ---------------------------------------------------------------------
% raws Raw Images
% ---------------------------------------------------------------------
raws2           = cfg_files;
raws2.tag       = 'PD';
raws2.name      = 'PD images';
raws2.help      = {'Input PD images in the same order.'}; 
raws2.filter    = 'image';
raws2.ufilter   = '.*';
raws2.num       = [0 Inf];
raws2.val       = {''};
% ---------------------------------------------------------------------
% raws Raw Images
% ---------------------------------------------------------------------
raws1           = cfg_files;
raws1.tag       = 'MT';
raws1.name      = 'MT images';
raws1.help      = {'Input MT images in the same order.'}; 
raws1.filter    = 'image';
raws1.ufilter   = '.*';
raws1.num       = [0 Inf];
raws1.val       = {''};
% ---------------------------------------------------------------------
% const no_pdmask
% ---------------------------------------------------------------------
no_pdmask  = cfg_const;
no_pdmask.tag = 'no_pdmask';
no_pdmask.name = 'No';
no_pdmask.help = {'Maps will not be masked with PD maps.'};
no_pdmask.val = {0};
% ---------------------------------------------------------------------
% entry pdmask_thresh
% ---------------------------------------------------------------------
pdmask_thresh = cfg_entry;
pdmask_thresh.tag = 'pdmask_thresh';
pdmask_thresh.name = 'Binarization threshold (fraction of range)';
pdmask_thresh.help = {'PD maps will be binarized using this threshold.'};
pdmask_thresh.strtype = 'e';
pdmask_thresh.num = [1 1];
pdmask_thresh.val = {0.1};
% ---------------------------------------------------------------------
% entry pdmask_erosions
% ---------------------------------------------------------------------
pdmask_erosions = cfg_entry;
pdmask_erosions.tag = 'pdmask_erosions';
pdmask_erosions.name = 'Size of erosions';
pdmask_erosions.help = {'Size of erosions'};
pdmask_erosions.strtype = 'e';
pdmask_erosions.num = [1 5];
pdmask_erosions.val = {[10 0 0 0 0]};
% ---------------------------------------------------------------------
% entry pdmask_dilations
% ---------------------------------------------------------------------
pdmask_dilations = cfg_entry;
pdmask_dilations.tag = 'pdmask_dilations';
pdmask_dilations.name = 'Size of dilations';
pdmask_dilations.help = {'Size of dilations'};
pdmask_dilations.strtype = 'e';
pdmask_dilations.num = [1 5];
pdmask_dilations.val = {[4 0 0 0 0]};
% ---------------------------------------------------------------------
% branch pdmask_thresh
% ---------------------------------------------------------------------
pdmask = cfg_branch;
pdmask.tag = 'pdmask';
pdmask.name = 'Yes';
pdmask.help = {'Maps will be masked with PD maps.'};
pdmask.val = {pdmask_thresh pdmask_erosions pdmask_dilations};
% ---------------------------------------------------------------------
% choice pdmask_choice
% ---------------------------------------------------------------------
pdmask_choice          = cfg_choice;
pdmask_choice.tag      = 'pdmask_choice';
pdmask_choice.name     = 'Mask output maps with PD maps';
pdmask_choice.help     = {'All output maps will be masked using PD maps if Yes is selected.'};
pdmask_choice.values   = {pdmask no_pdmask};
pdmask_choice.val      = {no_pdmask};
% ---------------------------------------------------------------------
% vols Volumes
% ---------------------------------------------------------------------
raws            = cfg_branch;
raws.tag        = 'raw_mpm';
raws.name       = 'Raw multiparameter data';
raws.help       = {'Input all the MT/PD/T1 images in this order.'}; 
raws.val        = {raws1 raws2 raws3 pdmask_choice};
% ---------------------------------------------------------------------
% menu type_b1
% ---------------------------------------------------------------------
b1_type         = cfg_menu;
b1_type.tag     = 'b1_type';
b1_type.name    = 'Choose the B1map type';
b1_type.help    = {'This is the option to choose the type of the B1 map acquisition. If you use B1 maps other than the explicitly stated versions the function will use the defaults for version 3D_EPI_v2b'};
b1_type.labels  = {
                '3D_EPI_v2b'
                '3D_EPI_v2b_long'
                '3D_EPI_rect700'
                }';
b1_type.values = {
                '3D_EPI_v2b'
                '3D_EPI_v2b_long'
                '3D_EPI_rect700'
                }';
b1_type.val    = {'3D_EPI_v2b'};
% ---------------------------------------------------------------------
% vols Volumes
% ---------------------------------------------------------------------
braws2          = cfg_files;
braws2.tag      = 'b1';
braws2.name     = 'Pairs of SE and STE images';
braws2.help     = {'Select B1 images - 3D EPI SE & STE'}; 
braws2.filter   = 'image';
braws2.ufilter  = '.*';
braws2.num      = [0 22];
braws2.val      = {''};
% ---------------------------------------------------------------------
% vols Volumes
% ---------------------------------------------------------------------
braws1          = cfg_files;
braws1.tag      = 'b0';
braws1.name     = 'B0 images';
braws1.help     = {'Select B0 images'}; 
braws1.filter   = 'image';
braws1.ufilter  = '.*';
braws1.num      = [0 3];
braws1.val      = {''};
% ---------------------------------------------------------------------
% vols Volumes
% ---------------------------------------------------------------------
braws           = cfg_branch;
braws.tag       = 'raw_fld';
braws.name      = 'Raw B0 & B1 data';
braws.help      = {'Input all B0 & B1 images in this order.'}; 
braws.val       = {braws1 braws2 b1_type};
% ---------------------------------------------------------------------
% subj Subject
% ---------------------------------------------------------------------
subj            = cfg_branch;
subj.tag        = 'subj';
subj.name       = 'Subject';
subj.val        = {braws raws };
subj.help       = {'Specify a subject for maps calculation.'};
% ---------------------------------------------------------------------
% data Data
% ---------------------------------------------------------------------
sdata           = cfg_repeat;
sdata.tag       = 'data';
sdata.name      = 'Data';
sdata.val       = {subj };
sdata.help      = {'Specify the number of subjects.'};
sdata.values    = {subj };
sdata.num       = [1 Inf];
% ---------------------------------------------------------------------
% indir Input directory as output directory
% ---------------------------------------------------------------------
indir         = cfg_menu;
indir.tag     = 'indir';
indir.name    = 'Input directory';
indir.help    = {'Output files will be written to the same folder as each corresponding input file.'};
indir.labels = {'Yes'};
indir.values = {1};
indir.val = {1};
% ---------------------------------------------------------------------
% outdir Output directory
% ---------------------------------------------------------------------
outdir         = cfg_files;
outdir.tag     = 'outdir';
outdir.name    = 'Output directory';
outdir.help    = {'Select a directory where output files will be written to.'};
outdir.filter = 'dir';
outdir.ufilter = '.*';
outdir.num     = [1 1];
% ---------------------------------------------------------------------
% output Output choice
% ---------------------------------------------------------------------
output         = cfg_choice;
output.tag     = 'output';
output.name    = 'Output choice';
output.help    = {'Output directory can be the same as the input directory for each input file or user selected'};
output.values  = {indir outdir };
output.val = {indir};
% ---------------------------------------------------------------------
% create1 Create MPR maps with B0/B1 maps
% ---------------------------------------------------------------------
create1         = cfg_exbranch;
create1.tag     = 'mp_img_b_img';
create1.name    = 'Multiparameter & B0/B1 images';
raws.val        = {raws1 raws2 raws3 pdmask_choice};
braws.val       = {braws1 braws2 };
subj.val        = {output braws raws };
sdata.val       = {subj };
sdata.values    = {subj };
create1.val     = {auto_pipeline b1_type sdata };
%create1.check   = @check_maps_b0_b1;
create1.help    = {'Use this option when B0/B1 3D maps available.'};
create1.prog    = @vbq_mpr_b0_b1;
create1.vout    = @vout_crt1;
% ---------------------------------------------------------------------
% create Create MPR maps with UNICORT B1
% ---------------------------------------------------------------------
create          = cfg_exbranch;
create.tag      = 'mp_img_unicort';
create.name     = 'Multiparameter & UNICORT_B1 images';
raws.val        = {raws1 raws2 raws3 pdmask_choice};
subj.val        = {output raws };
sdata.val       = {subj };
sdata.values    = {subj };
create.val      = {auto_pipeline sdata };
%create.check    = @check_maps_unicort;
create.help     = {'Use this option when B0/B1 3D maps not available. Bias field estimation and correction will be performed',...
    'using the approach described in ''Unified segmentation based correction... (UNICORT) paper by Weiskopf et al., 2011 '};
create.prog     = @vbq_mpr_unicort;
create.vout     = @vout_crt;
% ---------------------------------------------------------------------
% maps maps Create maps
% ---------------------------------------------------------------------
crm             = cfg_choice;
crm.tag         = 'crt_maps';
crm.name        = 'Create maps';
crm.help        = {'You have the option to create B1 corrected parameter maps estimated from dual flip angle FLASH experiment.'};
crm.values      = {create create1 };

%----------------------------------------------------------------------

% ---------------------------------------------------------------------
% Data processing
% ---------------------------------------------------------------------

% ---------------------------------------------------------------------
% biasreg Bias regularisation
% ---------------------------------------------------------------------
biasreg         = cfg_menu;
biasreg.tag     = 'biasreg';
biasreg.name    = 'Bias regularisation';
biasreg.help    = {
                   'MR images are usually corrupted by a smooth, spatially varying artifact that modulates the intensity of the image (bias). These artifacts, although not usually a problem for visual inspection, can impede automated processing of the images.'
                   ''
                   'An important issue relates to the distinction between intensity variations that arise because of bias artifact due to the physics of MR scanning, and those that arise due to different tissue properties.  The objective is to model the latter by different tissue classes, while modelling the former with a bias field. We know a priori that intensity variations due to MR physics tend to be spatially smooth, whereas those due to different tissue types tend to contain more high frequency information. A more accurate estimate of a bias field can be obtained by including prior knowledge about the distribution of the fields likely to be encountered by the correction algorithm. For example, if it is known that there is little or no intensity non-uniformity, then it would be wise to penalise large values for the intensity non-uniformity parameters. This regularisation can be placed within a Bayesian context, whereby the penalty incurred is the negative logarithm of a prior probability for any particular pattern of non-uniformity.'
                   'Knowing what works best should be a matter of empirical exploration.  For example, if your data has very little intensity non-uniformity artifact, then the bias regularisation should be increased.  This effectively tells the algorithm that there is very little bias in your data, so it does not try to model it.'
                   }';
biasreg.labels = {
                  'no regularisation (0)'
                  'extremely light regularisation (0.00001)'
                  'very light regularisation (0.0001)'
                  'light regularisation (0.001)'
                  'medium regularisation (0.01)'
                  'heavy regularisation (0.1)'
                  'very heavy regularisation (1)'
                  'extremely heavy regularisation (10)'
                  }';
biasreg.values = {
                  0
                  1e-05
                  0.0001
                  0.001
                  0.01
                  0.1
                  1
                  10
                  }';
biasreg.val    = {0.0001};
% ---------------------------------------------------------------------
% biasfwhm Bias FWHM
% ---------------------------------------------------------------------
biasfwhm         = cfg_menu;
biasfwhm.tag     = 'biasfwhm';
biasfwhm.name    = 'Bias FWHM';
biasfwhm.help    = {'FWHM of Gaussian smoothness of bias. If your intensity non-uniformity is very smooth, then choose a large FWHM. This will prevent the algorithm from trying to model out intensity variation due to different tissue types. The model for intensity non-uniformity is one of i.i.d. Gaussian noise that has been smoothed by some amount, before taking the exponential. Note also that smoother bias fields need fewer parameters to describe them. This means that the algorithm is faster for smoother intensity non-uniformities.'};
biasfwhm.labels = {
                   '30mm cutoff'
                   '40mm cutoff'
                   '50mm cutoff'
                   '60mm cutoff'
                   '70mm cutoff'
                   '80mm cutoff'
                   '90mm cutoff'
                   '100mm cutoff'
                   '110mm cutoff'
                   '120mm cutoff'
                   '130mm cutoff'
                   '140mm cutoff'
                   '150mm cutoff'
                   'No correction'
                   }';
biasfwhm.values = {
                   30
                   40
                   50
                   60
                   70
                   80
                   90
                   100
                   110
                   120
                   130
                   140
                   150
                   Inf
                   }';
biasfwhm.val    = {60};
% ---------------------------------------------------------------------
% write Save Bias Corrected
% ---------------------------------------------------------------------
write         = cfg_menu;
write.tag     = 'write';
write.name    = 'Save Bias Corrected';
write.help    = {'This is the option to save a bias corrected version of your images from this struct, or/and the estimated bias field. MR images are usually corrupted by a smooth, spatially varying artifact that modulates the intensity of the image (bias). These artifacts, although not usually a problem for visual inspection, can impede automated processing of the images.  The bias corrected version should have more uniform intensities within the different types of tissues.'};
write.labels = {
                'Save Nothing'
                'Save Bias Corrected'
                'Save Bias Field'
                'Save Field and Corrected'
                }';
write.values = {
                [0 0]
                [0 1]
                [1 0]
                [1 1]
                }';
write.val    = {[0 0]};
% ---------------------------------------------------------------------
% vols Volumes
% ---------------------------------------------------------------------
vols            = cfg_files;
vols.tag        = 's_vols';
vols.name       = 'T1w or MT images';
vols.help       = {'Select T1w or MT images for "unified segmentation".'};
vols.filter     = 'image';
vols.ufilter    = '.*';
vols.num        = [1 Inf];% channel.help    = {'Specify a channel for processing. If multiple channels are used (eg PD & T2), then the same order of subjects must be specified for each channel and they must be in register (same position, size, voxel dims etc..). The different channels can be treated differently in terms of inhomogeneity correction etc. You may wish to correct some channels and save the corrected images, whereas you may wish not to do this for other channels.'};
% ---------------------------------------------------------------------
% data Data
% ---------------------------------------------------------------------
struct          = cfg_branch;
struct.tag      = 'struct';
struct.name     = 'Structurals';
struct.val      = {vols biasreg biasfwhm write };
struct.help     = {'Specify the structural volume for "unified segmentation". MT maps have been show to delineate iron containing structures (e.g. pallidum, substantia nigra) better than T1 weighted images'};
% ---------------------------------------------------------------------
% tpm Tissue probability map
% ---------------------------------------------------------------------
tpm         = cfg_files;
tpm.tag     = 'tpm';
tpm.name    = 'Tissue probability map';
tpm.help    = {
               'Select the tissue probability image for this class. These should be maps of eg grey matter, white matter or cerebro-spinal fluid probability. A nonlinear deformation field is estimated that best overlays the tissue probability maps on the individual subjects'' image. The default tissue probability maps are modified versions of the ICBM Tissue Probabilistic Atlases.These tissue probability maps are kindly provided by the International Consortium for Brain Mapping, John C. Mazziotta and Arthur W. Toga. http://www.loni.ucla.edu/ICBM/ICBM_TissueProb.html. The original data are derived from 452 T1-weighted scans, which were aligned with an atlas space, corrected for scan inhomogeneities, and classified into grey matter, white matter and cerebrospinal fluid. These data were then affine registered to the MNI space and down-sampled to 2mm resolution.'
               ''
               'Rather than assuming stationary prior probabilities based upon mixing proportions, additional information is used, based on other subjects'' brain images.  Priors are usually generated by registering a large number of subjects together, assigning voxels to different tissue types and averaging tissue classes over subjects. Three tissue classes are used: grey matter, white matter and cerebro-spinal fluid. A fourth class is also used, which is simply one minus the sum of the first three. These maps give the prior probability of any voxel in a registered image being of any of the tissue classes - irrespective of its intensity.'
               ''
               'The model is refined further by allowing the tissue probability maps to be deformed according to a set of estimated parameters. This allows spatial normalisation and segmentation to be combined into the same model.'
               }';
tpm.filter = 'image';
tpm.ufilter = '.*';
tpm.num     = [1 1];
% ---------------------------------------------------------------------
% ngaus Num. Gaussians
% ---------------------------------------------------------------------
ngaus         = cfg_menu;
ngaus.tag     = 'ngaus';
ngaus.name    = 'Num. Gaussians';
ngaus.help    = {
                 'The number of Gaussians used to represent the intensity distribution for each tissue class can be greater than one. In other words, a tissue probability map may be shared by several clusters. The assumption of a single Gaussian distribution for each class does not hold for a number of reasons. In particular, a voxel may not be purely of one tissue type, and instead contain signal from a number of different tissues (partial volume effects). Some partial volume voxels could fall at the interface between different classes, or they may fall in the middle of structures such as the thalamus, which may be considered as being either grey or white matter. Various other image segmentation approaches use additional clusters to model such partial volume effects. These generally assume that a pure tissue class has a Gaussian intensity distribution, whereas intensity distributions for partial volume voxels are broader, falling between the intensities of the pure classes. Unlike these partial volume segmentation approaches, the model adopted here simply assumes that the intensity distribution of each class may not be Gaussian, and assigns belonging probabilities according to these non-Gaussian distributions. Typical numbers of Gaussians could be two for grey matter, two for white matter, two for CSF, three for bone, four for other soft tissues and two for air (background).'
                 'Note that if any of the Num. Gaussians is set to non-parametric, then a non-parametric approach will be used to model the tissue intensities. This may work for some images (eg CT), but not others - and it has not been optimised for multi-channel data. Note that it is likely to be especially problematic for images with poorly behaved intensity histograms due to aliasing effects that arise from having discrete values on the images.'
                 }';
ngaus.labels = {
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                'Nonparametric'
                }';
ngaus.values = {
                1
                2
                3
                4
                5
                6
                7
                8
                Inf
                }';
ngaus.val    = {Inf};
% ---------------------------------------------------------------------
% native Native Tissue
% ---------------------------------------------------------------------
native         = cfg_menu;
native.tag     = 'native';
native.name    = 'Native Tissue';
native.help    = {'The native space option allows you to produce a tissue class image (c*) that is in alignment with the original/* (see Figure \ref{seg1})*/. It can also be used for ``importing'''' into a form that can be used with the DARTEL toolbox (rc*).'};
native.labels = {
                 'None'
                 'Native Space'
                 'DARTEL Imported'
                 'Native + DARTEL Imported'
                 }';
native.values = {
                 [0 0]
                 [1 0]
                 [0 1]
                 [1 1]
                 }';
native.val    = {[1 1]};
% ---------------------------------------------------------------------
% warped Warped Tissue
% ---------------------------------------------------------------------
warped         = cfg_menu;
warped.tag     = 'warped';
warped.name    = 'Warped Tissue';
warped.help    = {
                  'You can produce spatially normalised versions of the tissue class - both with (mwc*) and without (wc*) modulation (see below). These can be used for voxel-based morphometry. All you need to do is smooth them and do the stats.'
                  ''
                  '``Modulation'''' is to compensate for the effect of spatial normalisation.  When warping a series of images to match a template, it is inevitable that volumetric differences will be introduced into the warped images.  For example, if one subject''s temporal lobe has half the volume of that of the template, then its volume will be doubled during spatial normalisation. This will also result in a doubling of the voxels labelled grey matter.  In order to remove this confound, the spatially normalised grey matter (or other tissue class) is adjusted by multiplying by its relative volume before and after warping.  If warping results in a region doubling its volume, then the correction will halve the intensity of the tissue label. This whole procedure has the effect of preserving the total amount of grey matter signal in the normalised partitions.  Actually, in this version of SPM the warped data are not scaled by the Jacobian determinants when generating the "modulated" data.  Instead, the original voxels are projected into their new location in the warped images.  This exactly preserves the tissue count, but has the effect of introducing aliasing artifacts - especially if the original data are at a lower resolution than the warped images.  Smoothing should reduce this artifact though.'
                  'Note also that the "unmodulated" data are generated slightly differently in this version of SPM. In this version, the projected data are corrected using a kind of smoothing procedure. This is not done exactly as it should be done (to save computational time), but it does a reasonable job. It also has the effect of extrapolating the warped tissue class images beyond the range of the original data.  This extrapolation is not perfect, as it is only an estimate, but it may still be a good thing to do.'
                  }';
warped.labels = {
                 'None'
                 'Modulated'
                 'Unmodulated'
                 'Modulated + Unmodulated'
                 }';
warped.values = {
                 [0 0]
                 [0 1]
                 [1 0]
                 [1 1]
                 }';
warped.val    = {[0 1]};
% ---------------------------------------------------------------------
% tissue Tissue
% ---------------------------------------------------------------------
tissue         = cfg_branch;
tissue.tag     = 'tissue';
tissue.name    = 'Tissue';
tissue.val     = {tpm ngaus native warped };
tissue.help    = {'A number of options are available for each of the tissues.  You may wish to save images of some tissues, but not others. If planning to use DARTEL, then make sure you generate ``imported'''' tissue class images of grey and white matter (and possibly others).  Different numbers of Gaussians may be needed to model the intensity distributions of the various tissues.'};
% ---------------------------------------------------------------------
% tissues Tissues
% ---------------------------------------------------------------------
tissues         = cfg_repeat;
tissues.tag     = 'tissues';
tissues.name    = 'Tissues';
tissues.values  = {tissue };
tissues.num     = [0 Inf];

tissues.val     = {tissue tissue tissue tissue tissue tissue };
tpm_nam = fullfile(fileparts(which('spm_preproc8.m')),'TPM.nii');
ngaus   = [2 2 2 3 4 2];
nval    = {[1 1],[1 1],[1 1],[0 0],[0 0],[0 0]};
mval    = {[0 1],[0 1],[0 1],[0 0],[0 0],[0 0]};
for k=1:numel(ngaus),
    tissue.val{1}.val{1} = {[tpm_nam ',' num2str(k)]};
    tissue.val{2}.val    = {ngaus(k)};
    tissue.val{3}.val    = {nval{k}};
    tissue.val{4}.val    = {mval{k}};
    tissues.val{k}       = tissue;
end

tissues.help = {'The data for each subject are classified into a number of different tissue types.  The tissue types are defined according to tissue probability maps, which define the prior probability of finding a tissue type at a particular location. Typically, the order of tissues is grey matter, white matter, CSF, bone, soft tissue and air/background (if using toolbox/Seg/TPM.nii).'};
% ---------------------------------------------------------------------
% mrf MRF Parameter for the new version(4334)
% ---------------------------------------------------------------------
mrf         = cfg_entry;
mrf.tag     = 'mrf';
mrf.name    = 'MRF Parameter';
mrf.help    = {'When tissue class images are written out, a few iterations of a simple Markov Random Field (MRF) cleanup procedure are run.  This parameter controls the strength of the MRF. Setting the value to zero will disable the cleanup.'};
mrf.strtype = 'e';
mrf.num     = [1 1];
mrf.val     = {0}; % {2};
% ---------------------------------------------------------------------
% reg Warping Regularisation
% ---------------------------------------------------------------------
reg         = cfg_entry;
reg.tag     = 'reg';
reg.name    = 'Warping Regularisation';
reg.help    = {'The objective function for registering the tissue probability maps to the image to process, involves minimising the sum of two terms. One term gives a function of how probable the data is given the warping parameters. The other is a function of how probable the parameters are, and provides a penalty for unlikely deformations. Smoother deformations are deemed to be more probable. The amount of regularisation determines the tradeoff between the terms. Pick a value around one.  However, if your normalised images appear distorted, then it may be an idea to increase the amount of regularisation (by an order of magnitude). More regularisation gives smoother deformations, where the smoothness measure is determined by the bending energy of the deformations. '};
reg.strtype = 'e';
reg.num     = [1  1];
reg.val     = {4};
% ---------------------------------------------------------------------
% affreg Affine Regularisation
% ---------------------------------------------------------------------
affreg         = cfg_menu;
affreg.tag     = 'affreg';
affreg.name    = 'Affine Regularisation';
affreg.help    = {
                  'The procedure is a local optimisation, so it needs reasonable initial starting estimates. Images should be placed in approximate alignment using the Display function of SPM before beginning. A Mutual Information affine registration with the tissue probability maps (D''Agostino et al, 2004) is used to achieve approximate alignment. Note that this step does not include any model for intensity non-uniformity. This means that if the procedure is to be initialised with the affine registration, then the data should not be too corrupted with this artifact.If there is a lot of intensity non-uniformity, then manually position your image in order to achieve closer starting estimates, and turn off the affine registration.'
                  ''
                  'Affine registration into a standard space can be made more robust by regularisation (penalising excessive stretching or shrinking).  The best solutions can be obtained by knowing the approximate amount of stretching that is needed (e.g. ICBM templates are slightly bigger than typical brains, so greater zooms are likely to be needed). For example, if registering to an image in ICBM/MNI space, then choose this option.  If registering to a template that is close in size, then select the appropriate option for this.'
                  }';
affreg.labels = {
                 'No Affine Registration'
                 'ICBM space template - European brains'
                 'ICBM space template - East Asian brains'
                 'Average sized template'
                 'No regularisation'
                 }';
affreg.values = {
                 ''
                 'mni'
                 'eastern'
                 'subj'
                 'none'
                 }';
affreg.val    = {'mni'};
% ---------------------------------------------------------------------
% samp Sampling distance
% ---------------------------------------------------------------------
samp         = cfg_entry;
samp.tag     = 'samp';
samp.name    = 'Sampling distance';
samp.help    = {'This encodes the approximate distance between sampled points when estimating the model parameters. Smaller values use more of the data, but the procedure is slower and needs more memory. Determining the ``best'''' setting involves a compromise between speed and accuracy.'};
samp.strtype = 'e';
samp.num     = [1  1];
samp.val     = {3};
% ---------------------------------------------------------------------
% write Deformation Fields
% ---------------------------------------------------------------------
write             = cfg_menu;
write.tag         = 'write';
write.name        = 'Deformation Fields';
write.help        = {'Deformation fields can be saved to disk, and used by the Deformations Utility. For spatially normalising images to MNI space, you will need the forward deformation, whereas for spatially normalising (eg) GIFTI surface files, you''ll need the inverse. It is also possible to transform data in MNI space on to the individual subject, which also requires the inverse transform. Deformations are saved as .nii files, which contain three volumes to encode the x, y and z coordinates.'};
write.labels      = {
%                 'None'
%                 'Inverse'
                'Forward'
%                 'Inverse + Forward'
                }';
write.values      = {[0 1]
%                 [0 0]
%                 [1 0]
%                 
%                 [1 1]
                 }';
write.val         = {[0 1]};
% ---------------------------------------------------------------------
% warp Warping - for the new version (4334)
% ---------------------------------------------------------------------
warp         = cfg_branch;
warp.tag     = 'warp';
warp.name    = 'Warping & MRF';
warp.val     = {mrf reg affreg samp write };
warp.help    = {
'A number of warping options are provided, but the main one that you could consider changing is the one for specifying whether deformation fields or inverse deformation fields should be generated.'};
% % ---------------------------------------------------------------------
% %
% % ---------------------------------------------------------------------
fwhm         = cfg_entry;
fwhm.tag     = 'fwhm';
fwhm.name    = 'Gaussian FWHM';
fwhm.val     = {[6 6 6]};
fwhm.strtype = 'e';
fwhm.num     = [1 3];
fwhm.help    = {'Specify the full-width at half maximum (FWHM) of the ',...
    'Gaussian blurring kernel in mm. Three values should be entered',... 
    'denoting the FWHM in the x, y and z directions. Note that you can also specify [0 0 0]',...
    'but any ``modulated'' data will show aliasing (see eg Wikipedia), which occurs because of the way the warped images are generated.'};
% ---------------------------------------------------------------------
% vols Volumes
% ---------------------------------------------------------------------
vols_pm         = cfg_files;
vols_pm.tag     = 'mp_vols';
vols_pm.name    = 'Volumes';
vols_pm.help    = {'Select whole brain parameter maps (e.g. MT, R2*, FA etc) for processing.'}; 
vols_pm.filter  = 'image';
vols_pm.ufilter = '.*';
vols_pm.num     = [1 Inf];
% ---------------------------------------------------------------------
% data Data
% ---------------------------------------------------------------------
pams            = cfg_branch;
pams.tag        = 'maps';
pams.name       = 'Parameter maps';
pams.val        = {vols_pm };
pams.help       = {'Select whole brain parameter maps (e.g. MT, R2*, FA etc) for processing.'}; 
% ---------------------------------------------------------------------
% indir Input directory as output directory
% ---------------------------------------------------------------------
indir         = cfg_menu;
indir.tag     = 'indir';
indir.name    = 'Input directory';
indir.help    = {'Output files will be written to the same folder as each corresponding input file.'};
indir.labels = {'Yes'};
indir.values = {1};
% ---------------------------------------------------------------------
% outdir Output directory
% ---------------------------------------------------------------------
outdir         = cfg_files;
outdir.tag     = 'outdir';
outdir.name    = 'Output directory';
outdir.help    = {'Select a directory where output files will be written to.'};
outdir.filter = 'dir';
outdir.ufilter = '.*';
outdir.num     = [1 1];
% ---------------------------------------------------------------------
% output Output choice
% ---------------------------------------------------------------------
output         = cfg_choice;
output.tag     = 'output';
output.name    = 'Output choice';
output.help    = {'Output directory can be the same as the input directory for each input file or user selected'};
output.values  = {indir outdir };
% ---------------------------------------------------------------------
% subj Subject
% ---------------------------------------------------------------------
subjc            = cfg_branch;
subjc.tag        = 'subjc';
subjc.name       = 'Subject';
subjc.val        = {output pams struct };
subjc.help       = {'Specify a subject for maps calculation.'};
% ---------------------------------------------------------------------
% data Data
% ---------------------------------------------------------------------
sdatas           = cfg_repeat;
sdatas.tag       = 'data';
sdatas.name      = 'Data';
sdatas.val       = {subjc };
sdatas.help      = {'Specify the number of subjects. Note that all raw images have to be entered in the order MT/PD/T1/B1/B0.'};
sdatas.values    = {subjc };
sdatas.num       = [1 Inf];
% ---------------------------------------------------------------------
% newseg Segment MT/T1w data 
% ---------------------------------------------------------------------
preproc8          = cfg_exbranch;
preproc8.tag      = 'preproc8';
preproc8.name     = 'Maps preprocessing - "new segmentation"';
preproc8.val      = {sdatas tissues warp fwhm };
preproc8.help     = {
                    'This toolbox is currently only work in progress, and is an extension of the default unified segmentation.  The algorithm is essentially the same as that described in the Unified Segmentation paper, except for (i) a slightly different treatment of the mixing proportions, (ii) the use of an improved registration model, (iii) the ability to use multi-spectral data, (iv) an extended set of tissue probability maps, which allows a different treatment of voxels outside the brain. Some of the options in the toolbox do not yet work, and it has not yet been seamlessly integrated into the SPM8 software.  Also, the extended tissue probability maps need further refinement. The current versions were crudely generated (by JA) using data that was kindly provided by Cynthia Jongen of the Imaging Sciences Institute at Utrecht, NL.'
                    ''
                    'This function segments, bias corrects and spatially normalises - all in the same model/* \cite{ashburner05}*/.  Many investigators use tools within older versions of SPM for a technique that has become known as "optimised" voxel-based morphometry (VBM). VBM performs region-wise volumetric comparisons among populations of subjects. It requires the images to be spatially normalised, segmented into different tissue classes, and smoothed, prior to performing statistical tests/* \cite{wright_vbm,am_vbmreview,ashburner00b,john_should}*/. The "optimised" pre-processing strategy involved spatially normalising subjects'' brain images to a standard space, by matching grey matter in these images, to a grey matter reference.  The historical motivation behind this approach was to reduce the confounding effects of non-brain (e.g. scalp) structural variability on the registration. Tissue classification in older versions of SPM required the images to be registered with tissue probability maps. After registration, these maps represented the prior probability of different tissue classes being found at each location in an image.  Bayes rule can then be used to combine these priors with tissue type probabilities derived from voxel intensities, to provide the posterior probability.'
                    ''
                    'This procedure was inherently circular, because the registration required an initial tissue classification, and the tissue classification requires an initial registration.  This circularity is resolved here by combining both components into a single generative model. This model also includes parameters that account for image intensity non-uniformity. Estimating the model parameters (for a maximum a posteriori solution) involves alternating among classification, bias correction and registration steps. This approach provides better results than simple serial applications of each component.'
                    ''
                    'Note that on a 32 bit computer, the most memory that SPM or any other program can use at any time is 4Gbytes (or sometimes only 2Gbytes).  This is because the largest number that can be represented with 32 bits is 4,294,967,295, which limits how much memory may be addressed by any one process.  Out of memory errors may occasionally be experienced when trying to work with large images.  64-bit computers can usually handle such cases.'
                    }';
preproc8.prog     = @spm_local_preproc_run;
preproc8.vout     = @vout_preproc;
%----------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% -------------------------------------------------------------------------
% configuration for STEP 2: diffeomorphic registration (DARTEL)
% -------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ---------------------------------------------------------------------
% images Images
% ---------------------------------------------------------------------
images1         = cfg_files;
images1.tag     = 'images';
images1.name    = 'Images';
images1.help    = {'Select a set of imported images of the same type to be registered by minimising a measure of difference from the template.'};
images1.filter  = 'image';
images1.ufilter = '^r.*';
images1.num     = [1 Inf];
% ---------------------------------------------------------------------
% images Images
% ---------------------------------------------------------------------
images         = cfg_repeat;
images.tag     = 'images';
images.name    = 'Images';
images.help    = {'Select the images to be warped together. Multiple sets of images can be simultaneously registered. For example, the first set may be a bunch of grey matter images, and the second set may be the white matter images of the same subjects.'};
images.values  = {images1 };
images.num     = [1 Inf];
% ---------------------------------------------------------------------
% template Template basename
% ---------------------------------------------------------------------
template         = cfg_entry;
template.tag     = 'template';
template.name    = 'Template basename';
template.val     = {'Template'};
template.help    = {'Enter the base for the template name.  Templates generated at each outer iteration of the procedure will be basename_1.nii, basename_2.nii etc.  If empty, then no template will be saved. Similarly, the estimated flow-fields will have the basename appended to them.'};
template.strtype = 's';
template.num     = [1 Inf];
% ---------------------------------------------------------------------
% rform Regularisation Form
% ---------------------------------------------------------------------
rform         = cfg_menu;
rform.tag     = 'rform';
rform.name    = 'Regularisation Form';
rform.val     = {0};
rform.help    = {'The registration is penalised by some ``energy'''' term.  Here, the form of this energy term is specified. Three different forms of regularisation can currently be used.'};
rform.labels = {
                'Linear Elastic Energy'
                'Membrane Energy'
                'Bending Energy'
}';
rform.values  = {0 1 2};
% ---------------------------------------------------------------------
% its Inner Iterations
% ---------------------------------------------------------------------
its         = cfg_menu;
its.tag     = 'its';
its.name    = 'Inner Iterations';
its.val     = {3};
its.help    = {'The number of Gauss-Newton iterations to be done within this outer iteration. After this, new average(s) are created, which the individual images are warped to match.'};
its.labels  = {
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
}';
its.values  = {1 2 3 4 5 6 7 8 9 10};
% ---------------------------------------------------------------------
% rparam Reg params
% ---------------------------------------------------------------------
rparam         = cfg_entry;
rparam.tag     = 'rparam';
rparam.name    = 'Reg params';
rparam.val     = {[0.1 0.01 0.001]};
rparam.help    = {
                  'For linear elasticity, the parameters are mu, lambda and id. For membrane energy, the parameters are lambda, unused and id.id is a term for penalising absolute displacements, and should therefore be small.  For bending energy, the parameters are lambda, id1 and id2, and the regularisation is by (-lambda*Laplacian + id1)^2 + id2.'
                  'Use more regularisation for the early iterations so that the deformations are smooth, and then use less for the later ones so that the details can be better matched.'
}';
rparam.strtype = 'e';
rparam.num     = [1 3];
% ---------------------------------------------------------------------
% K Time Steps
% ---------------------------------------------------------------------
K         = cfg_menu;
K.tag     = 'K';
K.name    = 'Time Steps';
K.val     = {6};
K.help    = {'The number of time points used for solving the partial differential equations.  A single time point would be equivalent to a small deformation model. Smaller values allow faster computations, but are less accurate in terms of inverse consistency and may result in the one-to-one mapping breaking down.  Earlier iteration could use fewer time points, but later ones should use about 64 (or fewer if the deformations are very smooth).'};
K.labels = {
            '1'
            '2'
            '4'
            '8'
            '16'
            '32'
            '64'
            '128'
            '256'
            '512'
}';
K.values = {0 1 2 3 4 5 6 7 8 9};
% ---------------------------------------------------------------------
% slam Smoothing Parameter
% ---------------------------------------------------------------------
slam         = cfg_menu;
slam.tag     = 'slam';
slam.name    = 'Smoothing Parameter';
slam.val     = {1};
slam.help    = {'A LogOdds parameterisation of the template is smoothed using a multi-grid scheme.  The amount of smoothing is determined by this parameter.'};
slam.labels  = {
               'None'
               '0.5'
               '1'
               '2'
               '4'
               '8'
               '16'
               '32'
}';
slam.values  = {0 0.5 1 2 4 8 16 32};
% ---------------------------------------------------------------------
% param Outer Iteration
% ---------------------------------------------------------------------
param1         = cfg_branch;
param1.tag     = 'param';
param1.name    = 'Outer Iteration';
param1.val     = {its rparam K slam };
param1.help    = {'Different parameters can be specified for each outer iteration. Each of them warps the images to the template, and then regenerates the template from the average of the warped images. Multiple outer iterations should be used for more accurate results, beginning with a more coarse registration (more regularisation) then ending with the more detailed registration (less regularisation).'};

val = cell(1,6);
param = param1;
param.val{1}.val{1} = 3; % iits
param.val{2}.val{1} = [4 2 1e-6]; % rparam
param.val{3}.val{1} = 0; % K
param.val{4}.val{1} = 16;
val{1} = param;
param.val{1}.val{1} = 3; % iits
param.val{2}.val{1} = [2 1 1e-6]; % rparam
param.val{3}.val{1} = 0; % K
param.val{4}.val{1} = 8;
val{2} = param;
param.val{1}.val{1} = 3; % iits
param.val{2}.val{1} = [1 0.5 1e-6]; % rparam
param.val{3}.val{1} = 1; % K
param.val{4}.val{1} = 4;
val{3} = param;
param.val{1}.val{1} = 3; % iits
param.val{2}.val{1} = [0.5 0.25 1e-6]; % rparam
param.val{3}.val{1} = 2; % K
param.val{4}.val{1} = 2;
val{4} = param;
param.val{1}.val{1} = 3; % iits
param.val{2}.val{1} = [0.25 0.125 1e-6]; % rparam
param.val{3}.val{1} = 4; % K
param.val{4}.val{1} = 1;
val{5} = param;
param.val{1}.val{1} = 3; % iits
param.val{2}.val{1} = [0.25 0.125 1e-6]; % rparam
param.val{3}.val{1} = 6; % K
param.val{4}.val{1} = 0.5;
val{6} = param;

% ---------------------------------------------------------------------
% param Outer Iterations
% ---------------------------------------------------------------------
param         = cfg_repeat;
param.tag     = 'param';
param.name    = 'Outer Iterations';
param.val     = val;
param.help    = {'The images are averaged, and each individual image is warped to match this average.  This is repeated a number of times.'};
param.values  = {param1};
param.num     = [1 Inf];
% ---------------------------------------------------------------------
% lmreg LM Regularisation
% ---------------------------------------------------------------------
lmreg         = cfg_entry;
lmreg.tag     = 'lmreg';
lmreg.name    = 'LM Regularisation';
lmreg.val     = {0.01};
lmreg.help    = {'Levenberg-Marquardt regularisation.  Larger values increase the the stability of the optimisation, but slow it down.  A value of zero results in a Gauss-Newton strategy, but this is not recommended as it may result in instabilities in the FMG.'};
lmreg.strtype = 'e';
lmreg.num     = [1 1];
% ---------------------------------------------------------------------
% cyc Cycles
% ---------------------------------------------------------------------
cyc         = cfg_menu;
cyc.tag     = 'cyc';
cyc.name    = 'Cycles';
cyc.val     = {3};
cyc.help    = {'Number of cycles used by the full multi-grid matrix solver. More cycles result in higher accuracy, but slow down the algorithm. See Numerical Recipes for more information on multi-grid methods.'};
cyc.labels  = {
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
}';
cyc.values  = {1 2 3 4 5 6 7 8};
% ---------------------------------------------------------------------
% its Iterations
% ---------------------------------------------------------------------
its         = cfg_menu;
its.tag     = 'its';
its.name    = 'Iterations';
its.val     = {3};
its.help    = {'Number of relaxation iterations performed in each multi-grid cycle. More iterations are needed if using ``bending energy'''' regularisation, because the relaxation scheme only runs very slowly. See the chapter on solving partial differential equations in Numerical Recipes for more information about relaxation methods.'};
its.labels  = {
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
}';
its.values   = {1 2 3 4 5 6 7 8};
% ---------------------------------------------------------------------
% optim Optimisation Settings
% ---------------------------------------------------------------------
optim         = cfg_branch;
optim.tag     = 'optim';
optim.name    = 'Optimisation Settings';
optim.val     = {lmreg cyc its };
optim.help    = {'Settings for the optimisation.  If you are unsure about them, then leave them at the default values.  Optimisation is by repeating a number of Levenberg-Marquardt iterations, in which the equations are solved using a full multi-grid (FMG) scheme. FMG and Levenberg-Marquardt are both described in Numerical Recipes (2nd edition).'};
% ---------------------------------------------------------------------
% settings Settings
% ---------------------------------------------------------------------
settings         = cfg_branch;
settings.tag     = 'settings';
settings.name    = 'Settings';
settings.val     = {template rform param optim };
settings.help    = {'Various settings for the optimisation. The default values should work reasonably well for aligning tissue class images together.'};
% ---------------------------------------------------------------------
% warp Run DARTEL (create Templates)
% ---------------------------------------------------------------------
warp         = cfg_exbranch;
warp.tag     = 'warp';
warp.name    = 'Run DARTEL (create Templates)';
warp.val     = {images settings };
warp.check   = @check_dartel_template;
warp.help    = {'Run the DARTEL nonlinear image registration procedure. This involves iteratively matching all the selected images to a template generated from their own mean. A series of Template*.nii files are generated, which become increasingly crisp as the registration proceeds.'};
warp.prog    = @spm_dartel_template;
warp.vout    = @vout_dartel_template;
% ---------------------------------------------------------------------
% images Images
% ---------------------------------------------------------------------
images1         = cfg_files;
images1.tag     = 'images';
images1.name    = 'Images';
images1.help    = {'Select a set of imported images of the same type to be registered by minimising a measure of difference from the template.'};
images1.filter = 'image';
images1.ufilter = '^r.*';
images1.num     = [1 Inf];
% ---------------------------------------------------------------------
% images Images
% ---------------------------------------------------------------------
images         = cfg_repeat;
images.tag     = 'images';
images.name    = 'Images';
images.help    = {'Select the images to be warped together. Multiple sets of images can be simultaneously registered. For example, the first set may be a bunch of grey matter images, and the second set may be the white matter images of the same subjects.'};
images.values  = {images1 };
images.num     = [1 Inf];
% ---------------------------------------------------------------------
% rform Regularisation Form
% ---------------------------------------------------------------------
rform         = cfg_menu;
rform.tag     = 'rform';
rform.name    = 'Regularisation Form';
rform.val     = {0};
rform.help    = {'The registration is penalised by some ``energy'''' term.  Here, the form of this energy term is specified. Three different forms of regularisation can currently be used.'};
rform.labels  = {
                'Linear Elastic Energy'
                'Membrane Energy'
                'Bending Energy'
}';
rform.values  = {0 1 2};
% ---------------------------------------------------------------------
% its Inner Iterations
% ---------------------------------------------------------------------
its         = cfg_menu;
its.tag     = 'its';
its.name    = 'Inner Iterations';
its.val     = {3};
its.help    = {'The number of Gauss-Newton iterations to be done within this outer iteration.'};
its.labels  = {
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
}';
its.values  = {1 2 3 4 5 6 7 8 9 10};
% ---------------------------------------------------------------------
% rparam Reg params
% ---------------------------------------------------------------------
rparam         = cfg_entry;
rparam.tag     = 'rparam';
rparam.name    = 'Reg params';
rparam.val     = {[0.1 0.01 0.001]};
rparam.help    = {
                  'For linear elasticity, the parameters are mu, lambda and id. For membrane energy, the parameters are lambda, unused and id.id is a term for penalising absolute displacements, and should therefore be small.  For bending energy, the parameters are lambda, id1 and id2, and the regularisation is by (-lambda*Laplacian + id1)^2 + id2.'
                  'Use more regularisation for the early iterations so that the deformations are smooth, and then use less for the later ones so that the details can be better matched.'
}';
rparam.strtype = 'e';
rparam.num     = [1 3];
% ---------------------------------------------------------------------
% K Time Steps
% ---------------------------------------------------------------------
K         = cfg_menu;
K.tag     = 'K';
K.name    = 'Time Steps';
K.val     = {6};
K.help    = {'The number of time points used for solving the partial differential equations.  A single time point would be equivalent to a small deformation model. Smaller values allow faster computations, but are less accurate in terms of inverse consistency and may result in the one-to-one mapping breaking down.  Earlier iteration could use fewer time points, but later ones should use about 64 (or fewer if the deformations are very smooth).'};
K.labels  = {
            '1'
            '2'
            '4'
            '8'
            '16'
            '32'
            '64'
            '128'
            '256'
            '512'
}';
K.values  = {0 1 2 3 4 5 6 7 8 9};
% ---------------------------------------------------------------------
% template Template
% ---------------------------------------------------------------------
template         = cfg_files;
template.tag     = 'template';
template.name    = 'Template';
template.help    = {'Select template. Smoother templates should be used for the early iterations. Note that the template should be a 4D file, with the 4th dimension equal to the number of sets of images.'};
template.filter = 'nifti';
template.ufilter = '.*';
template.num     = [1 1];
% ---------------------------------------------------------------------
% param Outer Iteration
% ---------------------------------------------------------------------
param1         = cfg_branch;
param1.tag     = 'param';
param1.name    = 'Outer Iteration';
param1.val     = {its rparam K template };
param1.help    = {'Different parameters and templates can be specified for each outer iteration.'};

val = cell(1,6);
param = param1;
param.val{1}.val{1} = 3; % iits
param.val{2}.val{1} = [4 2 1e-6]; % rparam
param.val{3}.val{1} = 0; % K
val{1} = param;
param.val{1}.val{1} = 3; % iits
param.val{2}.val{1} = [2 1 1e-6]; % rparam
param.val{3}.val{1} = 0; % K
val{2} = param;
param.val{1}.val{1} = 3; % iits
param.val{2}.val{1} = [1 0.5 1e-6]; % rparam
param.val{3}.val{1} = 1; % K
val{3} = param;
param.val{1}.val{1} = 3; % iits
param.val{2}.val{1} = [0.5 0.25 1e-6]; % rparam
param.val{3}.val{1} = 2; % K
val{4} = param;
param.val{1}.val{1} = 3; % iits
param.val{2}.val{1} = [0.25 0.125 1e-6]; % rparam
param.val{3}.val{1} = 4; % K
val{5} = param;
param.val{1}.val{1} = 3; % iits
param.val{2}.val{1} = [0.25 0.125 1e-6]; % rparam
param.val{3}.val{1} = 6; % K
val{6} = param;

% ---------------------------------------------------------------------
% param Outer Iterations
% ---------------------------------------------------------------------
param         = cfg_repeat;
param.tag     = 'param';
param.name    = 'Outer Iterations';
param.val     = val;
param.help    = {'The images are warped to match a sequence of templates. Early iterations should ideally use smoother templates and more regularisation than later iterations.'};
param.values  = {param1};
param.num     = [1 Inf];
% ---------------------------------------------------------------------
% lmreg LM Regularisation
% ---------------------------------------------------------------------
lmreg         = cfg_entry;
lmreg.tag     = 'lmreg';
lmreg.name    = 'LM Regularisation';
lmreg.val     = {0.01};
lmreg.help    = {'Levenberg-Marquardt regularisation.  Larger values increase the the stability of the optimisation, but slow it down.  A value of zero results in a Gauss-Newton strategy, but this is not recommended as it may result in instabilities in the FMG.'};
lmreg.strtype = 'e';
lmreg.num     = [1 1];
% ---------------------------------------------------------------------
% cyc Cycles
% ---------------------------------------------------------------------
cyc         = cfg_menu;
cyc.tag     = 'cyc';
cyc.name    = 'Cycles';
cyc.val     = {3};
cyc.help    = {'Number of cycles used by the full multi-grid matrix solver. More cycles result in higher accuracy, but slow down the algorithm. See Numerical Recipes for more information on multi-grid methods.'};
cyc.labels = {
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
}';
cyc.values  = {1 2 3 4 5 6 7 8};
% ---------------------------------------------------------------------
% its Iterations
% ---------------------------------------------------------------------
its         = cfg_menu;
its.tag     = 'its';
its.name    = 'Iterations';
its.val     = {3};
its.help    = {'Number of relaxation iterations performed in each multi-grid cycle. More iterations are needed if using ``bending energy'''' regularisation, because the relaxation scheme only runs very slowly. See the chapter on solving partial differential equations in Numerical Recipes for more information about relaxation methods.'};
its.labels  = {
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
}';
its.values  = {1 2 3 4 5 6 7 8};
% ---------------------------------------------------------------------
% optim Optimisation Settings
% ---------------------------------------------------------------------
optim         = cfg_branch;
optim.tag     = 'optim';
optim.name    = 'Optimisation Settings';
optim.val     = {lmreg cyc its };
optim.help    = {'Settings for the optimisation.  If you are unsure about them, then leave them at the default values.  Optimisation is by repeating a number of Levenberg-Marquardt iterations, in which the equations are solved using a full multi-grid (FMG) scheme. FMG and Levenberg-Marquardt are both described in Numerical Recipes (2nd edition).'};
% ---------------------------------------------------------------------
% settings Settings
% ---------------------------------------------------------------------
settings         = cfg_branch;
settings.tag     = 'settings';
settings.name    = 'Settings';
settings.val     = {rform param optim };
settings.help    = {'Various settings for the optimisation. The default values should work reasonably well for aligning tissue class images together.'};
% ---------------------------------------------------------------------
% warp1 Run DARTEL (existing Templates)
% ---------------------------------------------------------------------
warp1         = cfg_exbranch;
warp1.tag     = 'warp1';
warp1.name    = 'Run DARTEL (existing Templates)';
warp1.val     = {images settings };
warp1.check   = @check_dartel_template;
warp1.help    = {'Run the DARTEL nonlinear image registration procedure to match individual images to pre-existing template data. Start out with smooth templates, and select crisp templates for the later iterations.'};
warp1.prog    = @spm_dartel_warp;
warp1.vout    = @vout_dartel_warp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---------------------------------------------------------------------
% jactransf Modulation
% ---------------------------------------------------------------------
jactransf         = cfg_menu;
jactransf.tag     = 'jactransf';
jactransf.name    = 'Modulation';
jactransf.val     = {0};
jactransf.help    = {'This allows the spatially normalised images to be rescaled by the Jacobian determinants of the deformations. Note that the rescaling is only approximate for deformations generated using smaller numbers of time steps.'};
jactransf.labels  = {
                    'Pres. Concentration (No "modulation")'
                    'Pres. Amount ("Modulation")'
}';
jactransf.values  = {0 1};
% ---------------------------------------------------------------------
% K Time Steps
% ---------------------------------------------------------------------
K         = cfg_menu;
K.tag     = 'K';
K.name    = 'Time Steps';
K.val     = {6};
K.help    = {'The number of time points used for solving the partial differential equations.  Note that Jacobian determinants are not very accurate for very small numbers of time steps (less than about 16).'};
K.labels  = {
            '1'
            '2'
            '4'
            '8'
            '16'
            '32'
            '64'
            '128'
            '256'
            '512'
}';
K.values  = {0 1 2 3 4 5 6 7 8 9};
% ---------------------------------------------------------------------
% interp Interpolation
% ---------------------------------------------------------------------
interp         = cfg_menu;
interp.tag     = 'interp';
interp.name    = 'Interpolation';
interp.val     = {1};
interp.help    = {
                  ['The method by which the images are sampled when ' ...
                  'being written in a different space. ' ...
                  '(Note that Inf or NaN values are treated as zero, ' ...
                  'rather than as missing data)']
                  '    Nearest Neighbour:'
                  '      - Fastest, but not normally recommended.'
                  '    Bilinear Interpolation:'
                  '      - OK for PET, realigned fMRI, or segmentations'
                  '    B-spline Interpolation:'
                  ['      - Better quality (but slower) interpolation' ...
                  '/* \cite{thevenaz00a}*/, especially with higher ' ...
                  'degree splines. Can produce values outside the ' ...
                  'original range (e.g. small negative values from an ' ...
                  'originally all positive image).']
}';
interp.labels  = {
                 'Nearest neighbour'
                 'Trilinear'
                 '2nd Degree B-spline'
                 '3rd Degree B-Spline '
                 '4th Degree B-Spline '
                 '5th Degree B-Spline'
                 '6th Degree B-Spline'
                 '7th Degree B-Spline'
}';
interp.values  = {0 1 2 3 4 5 6 7};

% ---------------------------------------------------------------------
%
% ---------------------------------------------------------------------
template        = cfg_files;
template.tag    = 'template';
template.name   = 'DARTEL Template';
template.filter = 'nifti';
template.num    = [0 1];
template.help   = {...
['Select the final Template file generated by DARTEL. This will be affine '...
 'registered with a TPM file, such that the resulting spatially normalised '...
 'images are closer aligned to MNI space. Leave empty if you do not wish to '...
 'incorporate a transform to MNI space '...
 '(ie just click ``done'' on the file selector, without selecting any images).']};
% % ---------------------------------------------------------------------
% %
% % ---------------------------------------------------------------------
fwhm         = cfg_entry;
fwhm.tag     = 'fwhm';
fwhm.name    = 'Gaussian FWHM';
fwhm.val     = {[6 6 6]};
fwhm.strtype = 'e';
fwhm.num     = [1 3];
fwhm.help    = {'Specify the full-width at half maximum (FWHM) of the ',...
    'Gaussian blurring kernel in mm. Three values should be entered',... 
    'denoting the FWHM in the x, y and z directions. Note that you can also specify [0 0 0]',...
    'but any ``modulated'' data will show aliasing (see eg Wikipedia), which occurs because of the way the warped images are generated.'};
% ---------------------------------------------------------------------
%
% ---------------------------------------------------------------------
vox          = cfg_entry;
vox.tag      = 'vox';
vox.name     = 'Voxel sizes';
vox.num      = [1 3];
vox.strtype  = 'e';
vox.val      = {[NaN NaN NaN]};
vox.help     = {[...
'Specify the voxel sizes of the deformation field to be produced. ',...
'Non-finite values will default to the voxel sizes of the template image',...
'that was originally used to estimate the deformation.']};
% ---------------------------------------------------------------------
%
% ---------------------------------------------------------------------
bb           = cfg_entry;
bb.tag       = 'bb';
bb.name      = 'Bounding box';
bb.strtype   = 'e';
bb.num       = [2 3];
bb.val       = {[NaN NaN NaN; NaN NaN NaN]};
bb.help      = {[...
'Specify the bounding box of the deformation field to be produced. ',...
'Non-finite values will default to the bounding box of the template image',...
'that was originally used to estimate the deformation.']};
% ---------------------------------------------------------------------
%
% ---------------------------------------------------------------------
flowfield         = cfg_files;
flowfield.tag     =  'flowfield';
flowfield.name    = 'Flow Field';
flowfield.filter  = 'nifti';
flowfield.ufilter = '^u_.*\.nii$';
flowfield.num     = [1 1];
flowfield.help    = {'DARTEL flow field for this subject.'};
% ---------------------------------------------------------------------
%
% ---------------------------------------------------------------------
images        = cfg_files;
images.tag    = 'images';
images.name   = 'Images';
images.filter = 'nifti';
images.num    = [2 2];
images.help   = {'Select both GM & WM images in the same order for this subject to spatially normalise and use further for mpm_data scaling after registration.'};
% ---------------------------------------------------------------------
% vols Volumes
% ---------------------------------------------------------------------
vols_pm         = cfg_files;
vols_pm.tag     = 'mp_vols';
vols_pm.name    = 'Volumes';
vols_pm.help    = {'Select whole brain parameter maps (e.g. MT, R2*, FA etc) for registration.'}; 
vols_pm.filter  = 'image';
vols_pm.ufilter = '.*';
vols_pm.num     = [1 Inf];
% ---------------------------------------------------------------------
% subj Subject
% ---------------------------------------------------------------------
subjd            = cfg_branch;
subjd.tag        = 'subjd';
subjd.name       = 'Subject';
subjd.val        = {vols_pm images flowfield };
subjd.help       = {'Subject to be spatially normalized.'};
% ---------------------------------------------------------------------
% data Data
% ---------------------------------------------------------------------
sdatad           = cfg_repeat;
sdatad.tag       = 'data';
sdatad.name      = 'Data';
sdatad.val       = {subjd };
sdatad.help      = {'Specify the number of subjects.'};
sdatad.values    = {subjd };
sdatad.num       = [1 Inf];
% ---------------------------------------------------------------------
%
% ---------------------------------------------------------------------
nrm       = cfg_exbranch;
nrm.tag   = 'mni_norm';
nrm.name  = 'Normalise to MNI Space';
nrm.val   = {sdatad, template, vox, bb, fwhm };
nrm.prog  = @spm_dartel_norm_fun_local;
%nrm.vout  = @vout_norm_fun;
% nrm.check = @check_norm_fun;
nrm.help  = {[...
'The procedure transforms the Gaussian smoothing kernel, which is',...
'applied in the standardised space, back into subject native space',...
'while preserving the weighted average of the parameter value over a',...
'region the size of the smoothing kernel.']};
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---------------------------------------------------------------------
% dartel DARTEL Tools
% ---------------------------------------------------------------------
dartel         = cfg_choice;
dartel.tag     = 'dartel';
dartel.name    = 'Maps preprocessing - "DARTEL"';
dartel.help    = {
                  'This toolbox is based around the ``A Fast Diffeomorphic Registration Algorithm'''' paper/* \cite{ashburner07} */. The idea is to register images by computing a ``flow field'''', which can then be ``exponentiated'''' to generate both forward and backward deformations. Currently, the software only works with images that have isotropic voxels, identical dimensions and which are in approximate alignment with each other. One of the reasons for this is that the approach assumes circulant boundary conditions, which makes modelling global rotations impossible. Another reason why the images should be approximately aligned is because there are interactions among the transformations that are minimised by beginning with images that are already almost in register. This problem could be alleviated by a time varying flow field, but this is currently computationally impractical.'
                  'Because of these limitations, images should first be imported. This involves taking the ``*_seg_sn.mat'''' files produced by the segmentation code of SPM5, and writing out rigidly transformed versions of the tissue class images, such that they are in as close alignment as possible with the tissue probability maps. Rigidly transformed original images can also be generated, with the option to have skull-stripped versions.'
                  'The next step is the registration itself.  This can involve matching single images together, or it can involve the simultaneous registration of e.g. GM with GM, WM with WM and 1-(GM+WM) with 1-(GM+WM) (when needed, the 1-(GM+WM) class is generated implicitly, so there is no need to include this class yourself). This procedure begins by creating a mean of all the images, which is used as an initial template. Deformations from this template to each of the individual images are computed, and the template is then re-generated by applying the inverses of the deformations to the images and averaging. This procedure is repeated a number of times.'
                  'Finally, warped versions of the images (or other images that are in alignment with them) can be generated. '
                  ''
                  'This toolbox is not yet seamlessly integrated into the SPM package. Eventually, the plan is to use many of the ideas here as the default strategy for spatial normalisation. The toolbox may change with future updates.  There will also be a number of other (as yet unspecified) extensions, which may include a variable velocity version (related to LDDMM). Note that the Fast Diffeomorphism paper only describes a sum of squares objective function. The multinomial objective function is an extension, based on a more appropriate model for aligning binary data to a template.'
}';
dartel.values  = {warp warp1 nrm }; %crt_warped jacdet crt_iwarped kernfun 
%dartel.num     = [0 Inf];
%_______________________________________________________________________
%
% ---------------------------------------------------------------------
% proc proc Preprocess maps
% ---------------------------------------------------------------------
proc         = cfg_choice;
proc.tag     = 'proc';
proc.name    = 'Process maps';
proc.help    = {
                'Parameter maps are registered to standard space, scaled and ready for voxel-based quantitative (VBQ) analysis.'
}';
proc.values  = {preproc8 dartel };    %shoot scale   
% ---------------------------------------------------------------------
% vbq VBQ Tools
% ---------------------------------------------------------------------
vbq         = cfg_choice;
vbq.tag     = 'VBQ';
vbq.name    = 'VBQ Tools';
vbq.help    = {
                  'This toolbox is based around the ``Regional specificity of MRI contrast ... (VBQ)'' paper by Draganski et al., 2011 NeuroImage and ''Unified segmentation based correction... (UNICORT) paper by Weiskopf et al., 2011. '
                  'This toolbox should be considered as only a beta (trial) version, and will include a number of (as yet unspecified) extensions in future updates.  Please report any bugs or problems to lreninfo@gmail.com.'
}';
vbq.values  = {crm proc };
%______________________________________________________________________

% functions segment & register
%_______________________________________________________________________
%======================================================================
function out = spm_local_preproc_run(job)
for nm=1:length(job.subjc)
    defsa.channel = job.subjc(nm).struct(1);
    defsa.channel.vols = job.subjc(nm).struct(1).s_vols;
    defsa.tissue  = job.tissue;
    defsa.warp    = job.warp;
    out.subjc(nm) = spm_preproc_run(defsa);
    defs.comp{1}.def = strcat(spm_str_manip(job.subjc(nm).struct(1).s_vols,'h'),filesep,'y_',spm_str_manip(job.subjc(nm).struct(1).s_vols,'tr'),'.nii');
    defs.ofname = '';
    defs.fnames = char(strvcat(job.subjc(nm).maps.mp_vols{:}));
    if isfield(job.subjc(nm).output,'indir') && job.subjc(nm).output.indir == 1
        defs.savedir.saveusr{1}=spm_str_manip(job.subjc(nm).maps.mp_vols{1},'h');
    else
        defs.savedir.saveusr{1}=job.subjc(nm).output.outdir{1};
    end
    defs.interp = 1;
    outdef = spm_defs(defs);
    for i=1:length(outdef.warped)
        if isfield(job.subjc(nm).output,'indir') && job.subjc(nm).output.indir == 1
            p=spm_str_manip(job.subjc(nm).maps.mp_vols{1},'h');
        else
            p=job.subjc(nm).output.outdir{1};
        end
        c1=insert_pref(job.subjc(nm).struct(1).s_vols{1},'mwc1');
        c2=insert_pref(job.subjc(nm).struct(1).s_vols{1},'mwc2');
        m_c1 = [spm_select('FPList',fullfile(spm('Dir'),'toolbox','Seg'),'TPM.nii') ',1'];
        m_c2 = [spm_select('FPList',fullfile(spm('Dir'),'toolbox','Seg'),'TPM.nii') ',2'];
        f=outdef.warped{i};
        p1= spm_imcalc_ui(strvcat(char(c1),char(f),m_c1),insert_pref(f,'p1_'),'(i1.*i2).*(i3>0.05)');
        p2= spm_imcalc_ui(strvcat(char(c2),char(f),m_c2),insert_pref(f,'p2_'),'(i1.*i2).*(i3>0.05)');
        m1=insert_pref(c1,'s');spm_smooth(c1,m1,job.fwhm);
        m2=insert_pref(c2,'s');spm_smooth(c2,m2,job.fwhm);
        n1=insert_pref(p1,'s');spm_smooth(p1,n1,job.fwhm);
        n2=insert_pref(p2,'s');spm_smooth(p2,n2,job.fwhm);
        q1 = spm_imcalc_ui(strvcat(n1,m1,m1),insert_pref(p1,'fin_uni_'),'(i1./i2).*(i3>0.05)');
        q2 = spm_imcalc_ui(strvcat(n2,m2,m2),insert_pref(p2,'fin_uni_'),'(i1./i2).*(i3>0.05)');
        delfiles=strrep({p1,p2,m1,m2,n1,n2},'.nii,1','.nii');
        spm_unlink(delfiles{:});
    end
    
end


%======================================================================
function dep = vout_preproc(job)
% This depends on job contents, which may not be present when virtual
% outputs are calculated.

cdep = cfg_dep;
% cdep(end).sname      = 'Seg Params';
% cdep(end).src_output = substruct('.','param','()',{':'});
% cdep(end).tgt_spec   = cfg_findspec({{'filter','mat','strtype','e'}});

% for nm=1:numel(job.subjc)
%     for i=1:numel(job.subjc(nm).struct),
%         if job.subjc(nm).struct(i).write(1),
%             cdep(end+1)          = cfg_dep;
%             cdep(end).sname      = sprintf('Bias Field (%d)',i);
%             cdep(end).src_output = substruct('.','data','()',{i},'.','biasfield','()',{':'});
%             cdep(end).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
%         end
%         if job.subjc(nm).struct(i).write(2),
%             cdep(end+1)          = cfg_dep;
%             cdep(end).sname      = sprintf('Bias Corrected (%d)',i);
%             cdep(end).src_output = substruct('.','data','()',{i},'.','biascorr','()',{':'});
%             cdep(end).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
%         end
%     end
% end

for nm=1:numel(job.subjc)
    for i=1:numel(job.tissue),
        if job.tissue(i).native(1),
            cdep(end+1)          = cfg_dep;
            cdep(end).sname      = sprintf('c%d_subj%d Images',i,nm);
            cdep(end).src_output = substruct('.','subjc','()',{nm},'.','tiss','()',{i},'.','c','()',{':'});
            cdep(end).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
        end
        if job.tissue(i).native(2),
            cdep(end+1)          = cfg_dep;
            cdep(end).sname      = sprintf('rc%d_subj%d Images',i,nm);
            cdep(end).src_output = substruct('.','subjc','()',{nm},'.','tiss','()',{i},'.','rc','()',{':'});
            cdep(end).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
        end
    end
    for i=1:numel(job.subjc(nm).maps.mp_vols)
        cdep(end+1)          = cfg_dep;
        cdep(end).sname      = sprintf('%d_subj%d Parameter Volumes',i,nm);
        cdep(end).src_output = substruct('.','subjc','()',{nm},'.','maps','.','mp_vols','()',{i});
        cdep(end).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
    end
    
end
dep = cdep;
%_______________________________________________________________________

function dep = vout_crt(job)
% This depends on job contents, which may not be present when virtual
% outputs are calculated.

k=1;
for i=1:numel(job.subj)
    
    cdep(k)            = cfg_dep;
    cdep(k).sname      = sprintf('R1_subj%d',i);
    cdep(k).src_output = substruct('.','subj','()',{i},'.','R1','()',{':'});
    cdep(k).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
    
    k=k+1;
    
    cdep(k)          = cfg_dep;
    cdep(k).sname      = sprintf('R1u_subj%d',i);
    cdep(k).src_output = substruct('.','subj','()',{i},'.','R1u','()',{':'});
    cdep(k).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
    
     k=k+1;
    
    cdep(k)            = cfg_dep;
    cdep(k).sname      = sprintf('R2s_subj%d',i);
    cdep(k).src_output = substruct('.','subj','()',{i},'.','R2s','()',{':'});
    cdep(k).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
    
     k=k+1;
    
    cdep(k)            = cfg_dep;
    cdep(k).sname      = sprintf('MT_subj%d',i);
    cdep(k).src_output = substruct('.','subj','()',{i},'.','MT','()',{':'});
    cdep(k).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
   
     k=k+1;
    
    cdep(k)            = cfg_dep;
    cdep(k).sname      = sprintf('A_subj%d',i);
    cdep(k).src_output = substruct('.','subj','()',{i},'.','A','()',{':'});
    cdep(k).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
    
     k=k+1;
    
    cdep(k)            = cfg_dep;
    cdep(k).sname      = sprintf('T1w_subj%d',i);
    cdep(k).src_output = substruct('.','subj','()',{i},'.','T1w','()',{':'});
    cdep(k).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
    
     k=k+1;
end
dep = cdep;
%_______________________________________________________________________

function dep = vout_crt1(job)
% This depends on job contents, which may not be present when virtual
% outputs are calculated.

k=1;

for i=1:numel(job.subj)

    cdep(k)            = cfg_dep;
    cdep(k).sname      = sprintf('R1_subj%d',i);
    cdep(k).src_output = substruct('.','subj','()',{i},'.','R1','()',{':'});
    cdep(k).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
    
    k=k+1;
     
    cdep(k)            = cfg_dep;
    cdep(k).sname      = sprintf('R2s_subj%d',i);
    cdep(k).src_output = substruct('.','subj','()',{i},'.','R2s','()',{':'});
    cdep(k).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
    
     k=k+1;
    
    cdep(k)            = cfg_dep;
    cdep(k).sname      = sprintf('MT_subj%d',i);
    cdep(k).src_output = substruct('.','subj','()',{i},'.','MT','()',{':'});
    cdep(k).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
   
     k=k+1;
    
    cdep(k)            = cfg_dep;
    cdep(k).sname      = sprintf('A_subj%d',i);
    cdep(k).src_output = substruct('.','subj','()',{i},'.','A','()',{':'});
    cdep(k).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
    
     k=k+1;
    
    cdep(k)            = cfg_dep;
    cdep(k).sname      = sprintf('T1w_subj%d',i);
    cdep(k).src_output = substruct('.','subj','()',{i},'.','T1w','()',{':'});
    cdep(k).tgt_spec   = cfg_findspec({{'filter','image','strtype','e'}});
    
     k=k+1;
end
dep = cdep;


%_______________________________________________________________________

%_______________________________________________________________________
function chk = check_dartel_template(job)
n1 = numel(job.images);
n2 = numel(job.images{1});
chk = '';
for i=1:n1,
    if numel(job.images{i}) ~= n2,
        chk = 'Incompatible number of images';
        break;
    end;
end;
%_______________________________________________________________________

%_______________________________________________________________________
function dep = vout_dartel_template(job)

if isa(job.settings.template,'cfg_dep') || ~ ...
        isempty(deblank(job.settings.template))
    for it=0:numel(job.settings.param),
        tdep(it+1)            = cfg_dep;
        tdep(it+1).sname      = sprintf('Template (Iteration %d)', it);
        tdep(it+1).src_output = substruct('.','template','()',{it+1});
        tdep(it+1).tgt_spec   = cfg_findspec({{'filter','nifti'}});
    end
else
    tdep = cfg_dep;
    tdep = tdep(false);
end

for i=1:numel(job.images{1})
    fdep(i)            = cfg_dep;
    fdep(i).sname      = sprintf('Flow Field_subj%d',i);
    fdep(i).src_output = substruct('.','files','()',{i});
    fdep(i).tgt_spec   = cfg_findspec({{'filter','nifti'}});
end
dep = [tdep fdep];
%_______________________________________________________________________

%_______________________________________________________________________
function dep = vout_dartel_warp(job)
for i=1:numel(job.images{1})
    fdep(i)            = cfg_dep;
    fdep(i).sname      = sprintf('Flow Field_subj%d',i);
    fdep(i).src_output = substruct('.','files','()',{i});
    fdep(i).tgt_spec   = cfg_findspec({{'filter','nifti'}});
end
dep = fdep;
%_______________________________________________________________________

function varargout = spm_dartel_norm_fun_local(job)
feds.template = job.template;
feds.vox      = job.vox;
feds.bb       = job.bb;
feds.fwhm     = [0 0 0];
for m=1:length(job.subjd)
    feds.data.subj(m).flowfield = job.subjd(m).flowfield;
    feds.data.subj(m).images    = job.subjd(m).images;
end
feds.preserve = 1;
spm_dartel_norm_fun(feds);
for mm=1:length(job.subjd)
    feds.data.subj(mm).images    = job.subjd(mm).mp_vols;
end
feds.preserve = 0;
spm_dartel_norm_fun(feds);
for nm=1:length(job.subjd)
    for i=1:length(job.subjd(nm).mp_vols)
        chk=check_entry(job.subjd(nm));
        if ~isempty(chk)
            error(chk)
        end
        p=spm_str_manip(job.subjd(nm).mp_vols{1},'h');
        c1=insert_pref(job.subjd(nm).images{1},'smw');
        c2=insert_pref(job.subjd(nm).images{2},'smw');
        m_c1 = [spm_select('FPList',fullfile(spm('Dir'),'toolbox','Seg'),'TPM.nii') ',1'];
        m_c2 = [spm_select('FPList',fullfile(spm('Dir'),'toolbox','Seg'),'TPM.nii') ',2'];
        f =insert_pref(job.subjd(nm).mp_vols{i},'sw');
        p1= spm_imcalc_ui(strvcat(char(c1),char(f),m_c1),insert_pref(f,'p1_'),'(i1.*i2).*(i3>0.05)');
        p2= spm_imcalc_ui(strvcat(char(c2),char(f),m_c2),insert_pref(f,'p2_'),'(i1.*i2).*(i3>0.05)');
        m1=insert_pref(c1,'s');spm_smooth(c1,m1,job.fwhm);
        m2=insert_pref(c2,'s');spm_smooth(c2,m2,job.fwhm);
        n1=insert_pref(p1,'s');spm_smooth(p1,n1,job.fwhm);
        n2=insert_pref(p2,'s');spm_smooth(p2,n2,job.fwhm);
        q1 = spm_imcalc_ui(strvcat(n1,m1,m1),insert_pref(p1,'fin_dart_'),'(i1./i2).*(i3>0.05)');
        q2 = spm_imcalc_ui(strvcat(n2,m2,m2),insert_pref(p2,'fin_dart_'),'(i1./i2).*(i3>0.05)');
        delfiles=strrep({p1,p2,m1,m2,n1,n2},'.nii,1','.nii');
        spm_unlink(delfiles{:});
    end
end
%======================================================================
function fout=insert_pref(f,p)
fout=strcat(spm_str_manip(f,'h'),filesep,p,spm_str_manip(f,'t'));
%======================================================================
function chk = check_entry(job)
n1 = numel(job.images);
chk = '';
n2 = sum(~cellfun('isempty',regexp(spm_str_manip(job.images,'t'),'(^c1|^c2).*.nii')));
if n1 ~= 2,
    chk = 'Wrong input - should be c1 and c2';
end
if n2 ~= 2,
    chk = 'Wrong input - should be c1 and c2';
end
