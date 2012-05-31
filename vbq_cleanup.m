function vbq_cleanup(d)
    x=dir(d);
    for i=3:numel(x)
        if x(i).isdir
            vbq_cleanup(fullfile(d, x(i).name));
        else
            if (x(i).name(1) == 's' || x(i).name(1) == 'f') && isempty(strfind(x(i).name, '_')) && ~isempty(strfind(x(i).name, '-'))
            else
                disp(x(i).name);
                delete(fullfile(d, x(i).name));
            end
        end
    end
end