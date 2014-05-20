function [P_RES, P_ERROS] = pos_class(fis)
P = dlmread('pos_matrix_file.txt',';');
s = size(P);
P_RES = zeros(length(P),1);
for line = 1:s(1)    
    last = 0;
    if P(line,2) == 0
        P_RES(line) = P(line,1);
    else
       for col = 1:s(2)
            if col == 1
                last = evalfis([P(line,col) P(line, col + 1)],fis);
            else
                if P(line,col) ~= 0 && col > 2
                    last = evalfis([last P(line, col)],fis);
                end    
            end    
       end
       P_RES(line) = last;
    end        
end

P_ERROS = 0; %false negative - FN
for l = 1:length(P_RES)
       if P_RES(l) < 0
          P_ERROS = P_ERROS + 1;
       end
end

clear col l last line s
    