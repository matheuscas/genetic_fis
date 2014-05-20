function mutated_individual = mutation( individual )
%mutation Summary of this function goes here
%   Detailed explanation goes here

individual_size = size(individual);
individual_size = individual_size(2);

mutation_index = randi([1 individual_size]);
value_to_mutate = individual(mutation_index);

if value_to_mutate == 1
    value_to_mutate = 2;
elseif value_to_mutate == 2
        choice = randi([0 1]);
        if choice == 0
            value_to_mutate = 1;
        else
            value_to_mutate = 3;
        end         
elseif value_to_mutate == 3
        choice = randi([0 1]);
        if choice == 0
            value_to_mutate = 2;
        else
            value_to_mutate = 4;
        end
elseif value_to_mutate == 4
        choice = randi([0 1]);
        if choice == 0
            value_to_mutate = 3;
        else
            value_to_mutate = 5;
        end
else
    value_to_mutate = 4;
    
end

mutated_individual = individual;
mutated_individual(mutation_index) = value_to_mutate;

end

