function new_population = reproduction( parents,elite, elite_count, ... 
            crossover_fraction,population_size, mutation_rate, crossover_rate, selection_type)
%For example, if the Population size is 20, the Elite count is 2, and the Crossover fraction is 0.8, the numbers of each type of children in the next generation are as follows:

%    There are two elite children.
%    There are 18 individuals other than elite children, so the algorithm rounds 0.8*18 = 14.4 to 14 to get the number of crossover children.
%    The remaining four individuals, other than elite children, are mutation children.

new_population_size = population_size - elite_count;
crossover_children = floor(new_population_size * crossover_fraction);
%mutation_children = new_population_size - crossover_children;
parents_size = size(parents);
parents_size = parents_size(2);

new_population = struct('code','', 'fitness',0);
crossover_children_count = 1;

while crossover_children_count <= crossover_children
    if selection_type == 0
        new_population(crossover_children_count) = struct('code', ... 
            crossover(parents(1).code, ... 
            parents(2).code, crossover_rate),'fitness',0);
    else
        new_population(crossover_children_count) = struct('code', ... 
            crossover(parents(randi([1 parents_size])).code, ... 
            parents(randi([1 parents_size])).code, crossover_rate),'fitness',0);
    end    
        
    crossover_children_count = crossover_children_count + 1;
end

mutation_children_count = crossover_children_count;

while mutation_children_count <= new_population_size
    if selection_type == 0
        new_population(mutation_children_count) = struct('code',mutation(parents(1).code, mutation_rate),'fitness',0);
        mutation_children_count = mutation_children_count + 1;
        new_population(mutation_children_count) = struct('code',mutation(parents(2).code, mutation_rate),'fitness',0);
        mutation_children_count = mutation_children_count + 1;
    else
        new_population(mutation_children_count) = struct('code',mutation(parents(randi([1 parents_size])).code, mutation_rate),'fitness',0);
        mutation_children_count = mutation_children_count + 1;
        %new_population(mutation_children_count) = struct('code',mutation(parents(randi([1 parents_size])).code, mutation_rate),'fitness',0);
        %mutation_children_count = mutation_children_count + 1;
    end    
end

elite_count_count = mutation_children_count;
elite_count_control = 0;
elite_count_index = 1;

while elite_count_control < elite_count
    new_population(elite_count_count) = struct('code',elite(elite_count_index).code,'fitness',elite(elite_count_index).fitness);
    elite_count_count = elite_count_count + 1; 
    elite_count_index = elite_count_index + 1;
    elite_count_control = elite_count_control + 1;
end

