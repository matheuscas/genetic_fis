N = dlmread('neg_matrix_file.txt',';');
N_RES = mean(N,2);

N_ERROS = 0; %false positives - FP
for l = 1:length(N_RES)
       if N_RES(l) > 0
          N_ERROS = N_ERROS + 1;
       end
end

clear l
    