P = dlmread('pos_matrix_file.txt',';');
P_RES = mean(P,2);

P_ERROS = 0; %false negative - FN
for l = 1:length(P_RES)
       if P_RES(l) < 0
          P_ERROS = P_ERROS + 1;
       end
end

clear l
