
function addPROT(VPfile, sbmodel)

fid = fopen(VPfile);
D = textscan(fid, '%s %f');
varname = D{1};
varvalue = D{2};
fclose(fid);
    
    for i = 1:length(varname)
        pobj = sbioselect(sbmodel,'Type','parameter', 'Name', varname{i});
        if (~isempty(pobj))
            set(pobj, 'value', varvalue(i));
        else
            pobj = sbioselect(sbmodel,'Type','species', 'Name', varname{i});
            if (~isempty(pobj))
                set(pobj, 'InitialAmount', varvalue(i)); 
            else
                pobj = sbioselect(sbmodel,'Type','compartment', 'Name', varname{i});
                if (~isempty(pobj))
                    set(pobj, 'Capacity', varvalue(i)); 
                else
                    fprintf('Not found: %s\n', varname{i});
                end
            end
        end
    end
end