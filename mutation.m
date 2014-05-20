function mutated_individual = mutation( individual, rate )
%mutation Summary of this function goes here
%   Detailed explanation goes here

individual_size = size(individual);
individual_size = individual_size(2);

for locus = 1:individual_size
    if randi([0 100]) <= rate
        %mutation_index = randi([1 individual_size]);
        value_to_mutate = individual(locus);

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
        individual(locus) = value_to_mutate;
    end    
end 

mutated_individual = individual;

end

