count_neg = 0;
for en = 1:length(N_RES)
    if N_RES(en) > 0
        count_neg = count_neg + 1; 
    end
end

V_NEG_ERRORS = zeros(count_neg,1);

index_neg = 1;
for j = 1:length(N_RES)
    if N_RES(j) > 0
        V_NEG_ERRORS(index_neg) = N_RES(j);
        index_neg = index_neg + 1;
    end    
end

mean(V_NEG_ERRORS)
std(V_NEG_ERRORS)
%plot(V_NEG_ERRORS)

%------------------

count_pos = 0;
for en = 1:length(P_RES)
    if P_RES(en) < 0
        count_pos = count_pos + 1; 
    end
end

V_POS_ERRORS = zeros(count_pos,1);

index_pos = 1;
for j = 1:length(P_RES)
    if P_RES(j) < 0
        V_POS_ERRORS(index_pos) = abs(P_RES(j));
        index_pos = index_pos + 1;
    end    
end

mean(V_POS_ERRORS)
std(V_POS_ERRORS)
plot(V_POS_ERRORS)

clear ans count_neg e en i index_neg j count_pos index_pos