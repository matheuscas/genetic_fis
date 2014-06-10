P = dlmread('pos_matrix_file.txt',';');
% P_RES = mean(P,2);

s = size(P);
lines = s(1);
columns = s(2);
P_RES = zeros(lines,1);

for l = 1:lines
    sum = 0;
    count = 0;
    for c = 1:columns
        if P(l,c) ~= 0
            sum = sum + P(l,c);
            count = count + 1;
        end
    end
    P_RES(l) = sum / count;
end    

P_ERROS = 0; %false negative - FN
for l = 1:length(P_RES)
       if P_RES(l) < 0
          P_ERROS = P_ERROS + 1;
       end
end

clear l
