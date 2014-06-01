function parents = elite_and_random_selection( population, quantity_to_select, elite_quantity)

pop_size = size(population);
pop_size = pop_size(2);

amount_to_be_selected = pop_size - elite_quantity;

quantity_election = 3;
if mod(amount_to_be_selected,2) == 0
    quantity_election = 2;
end    

elite = population(1:elite_quantity);
population(1:elite_quantity) = [];
pop_size = size(population);
pop_size = pop_size(2);
random_selected = struct('code','', 'fitness',0);
selected = 1;

while selected <= quantity_to_select && pop_size >= quantity_election
    candidates = struct('code','', 'fitness',0);
    for c = 1:quantity_election
        index = randi([1 pop_size]);
        candidates(c) = population(index);
        population(index) = [];
        pop_size = size(population);
        pop_size = pop_size(2);
    end
    candidates = sort_population_by_fitness(candidates);
    random_selected(selected) = candidates(1);
    selected = selected + 1;
end

parents = horzcat(elite, random_selected);

end

