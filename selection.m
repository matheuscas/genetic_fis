function parents = selection( population, type, quantity )
%selection Selects parents from population, based on method
%   type - selection method type
%           0 - Elitism, 1 - Rank (not implemented yet), 
%           2 - Roulette (not implemented yet)
%   quantity - number of individuals that will be selected

%sort population by fitness and gets the best two of them
population = sort_population_by_fitness(population);
parents = population(1:quantity);

end

