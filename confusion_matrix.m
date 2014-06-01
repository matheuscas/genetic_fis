function accuracy = confusion_matrix(P_RES, N_RES)
confusion = zeros(2,2);
%How many positive documents was predicted as positive ones? True Positives
TP = 0;
for l = 1:length(P_RES)
    if P_RES(l) > 0
        TP = TP + 1;
    end
end
confusion(1,1) = TP;

%How many positive documents was predicted as negatives ones? False
%Negatives
FN = 0;
for l = 1:length(P_RES)
    if P_RES(l) < 0
        FN = FN + 1;
    end
end
confusion(1,2) = FN;

%How many negative documents was predicted as positive ones? False
%Positives
FP = 0;
for l = 1:length(N_RES)
    if N_RES(l) > 0
        FP = FP + 1;
    end
end
confusion(2,1) = FP;

%How many negative documents was predicted as negative ones? True Negatives
TN = 0;
for l = 1:length(N_RES)
    if N_RES(l) < 0
        TN = TN + 1;
    end
end
confusion(2,2) = TN;

confusion
precision = (TP / (TP + FP));
recall = (TP / (TP + FN));
f1 = (2 * ((precision * recall) / (precision + recall)));
accuracy = ((TP + TN) / (TP + TN + FP + FN));
