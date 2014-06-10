N = dlmread('neg_matrix_file.txt',';');
%N_RES = mean(N,2);

s = size(N);
lines = s(1);
columns = s(2);
N_RES = zeros(lines,1);

for l = 1:lines
    sum = 0;
    count = 0;
    for c = 1:columns
        if N(l,c) ~= 0
            sum = sum + N(l,c);
            count = count + 1;
        end
    end
    N_RES(l) = sum / count;
end    

N_ERROS = 0; %false positives - FP
for l = 1:length(N_RES)
       if N_RES(l) > 0
          N_ERROS = N_ERROS + 1;
       end
end

clear l
    