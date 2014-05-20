function [N_RES, N_ERROS] = neg_class(fis)
N = dlmread('neg_matrix_file.txt',';');
s = size(N);
N_RES = zeros(length(N),1);
for line = 1:s(1)    
    last = 0;
    if N(line,2) == 0
        N_RES(line) = N(line,1);
    else
       for col = 1:s(2)
            if col == 1
                last = evalfis([N(line,col) N(line, col + 1)],fis);
            else
                if N(line,col) ~= 0 && col > 2
                    last = evalfis([last N(line, col)],fis);
                end    
            end    
       end
       N_RES(line) = last;
    end        
end

N_ERROS = 0; %false positives - FP
for l = 1:length(N_RES)
       if N_RES(l) > 0
          N_ERROS = N_ERROS + 1;
       end
end

clear col l last line s
    