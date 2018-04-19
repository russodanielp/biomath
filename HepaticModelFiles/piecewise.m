function y = piecewise(varargin)

    % If an even number of inputs was given, no default value exists.
    if rem(nargin,2)==0
      default = NaN;
    else 
      default = varargin{end};
    end

    % Number of definition/condition pairs.
    numdefs = floor(nargin/2);
    defn = cell2mat(varargin(1:2:2*numdefs));
    condn = logical(cell2mat(varargin(2:2:2*numdefs)));
    
    for k = 1:numdefs
        if (condn(k))
            y = defn(k);
            return;
        end
    end
    
    y = default;
    
end