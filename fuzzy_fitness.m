function fitness = fuzzy_fitness(consequents)
fis = readfis('fuzzy_class');
size_rules = size(fis.rule);
for r = 1:size_rules(2)
    fis.rule(1,r).consequent = consequents(r);
end
[N_RES, N_ERROS] = neg_class(fis);
[P_RES, P_ERROS] = pos_class(fis);
fitness = confusion_matrix(P_RES, N_RES);

