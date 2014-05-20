function parents = selection( population, type, elite_quantity,quantity_to_select )
%selection Selects parents from population, based on method
%   type - selection method type
%           0 - Elitism (default), 1 - Rank (not implemented yet), 
%           2 - Roulette (not implemented yet)
%           3 - Elitism and Ramdom
%   quantity - number of individuals that will be selected

%sort population by fitness and gets the best two of them
population = sort_population_by_fitness(population);
parents = population(1:elite_quantity);

if type == 3
    parents = elite_and_random_selection(population,quantity_to_select,elite_quantity);
end 

end

