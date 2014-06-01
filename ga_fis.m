%1 - The algorithm begins by creating a random initial population.
CROMOSSOME_SIZE = 25;
POPULATION_SIZE = 50;
PARENTS_SIZE = 20;
MAX_RANGE_VALUES = 5;
CROSSOVER_FRACTION = 0.8;
CROSSOVER_RATE = 50;
MUTATION_RATE = 10;
GENERATIONS = 100;
SELECTION_TYPE = 3; 
ELITE_COUNT = 5;

population = generate_population(CROMOSSOME_SIZE, POPULATION_SIZE, MAX_RANGE_VALUES);

%2 - The algorithm then creates a sequence of new populations. 
%At each step, the algorithm uses the individuals in the current generation 
%to create the next population. To create the new population, 
%the algorithm performs the following steps:

best_fitness = struct('code','', 'fitness',0);

for gen = 1:GENERATIONS

D = ['################ generation: ',num2str(gen)];
disp(D);

%a - Scores each member of the current population by computing its fitness value.
population = evaluate_population_fitness(population, POPULATION_SIZE);
%b - Scales the raw fitness scores to convert them into a more usable range of values.

% ???

%c - Selects members, called parents, based on their fitness.
parents = selection(population,SELECTION_TYPE,ELITE_COUNT, PARENTS_SIZE);

D = ['generation: ',num2str(gen),' / ','BEST FITNESS: ', num2str(parents(1).fitness),' / ','SECOND BEST FITNESS: ', num2str(parents(2).fitness)];
disp(D);

best_fitness = parents(1);

%d - Some of the individuals in the current population that have best 
%fitness are chosen as elite. These elite individuals are passed to the next population.

elite = population(1:ELITE_COUNT);

%e - Produces children from the parents. Children are produced either by 
%making random changes to a single parent?mutation?or by combining the 
%vector entries of a pair of parents?crossover.

population = reproduction(parents,elite,ELITE_COUNT,CROSSOVER_FRACTION,POPULATION_SIZE, MUTATION_RATE, CROSSOVER_RATE, SELECTION_TYPE);

%f - Replaces the current population with the children to form the next generation.
end

save(simulation2);



