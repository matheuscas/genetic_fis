function population = evaluate_population_fitness( population, POPULATION_SIZE )
for i = 1:POPULATION_SIZE
    D = ['individuo ',num2str(i),' / ','fitness (antes): ',num2str(population(i).fitness)];
    disp(D);    
    if population(i).fitness == 0
        disp('Evaluating...');
        temp = evaluate_fitness(population(i).code);
        D = ['individuo ',num2str(i),' / ','fitness (evaluated): ',num2str(temp)];
        disp(D);
        population(i).fitness = temp;
    end 
    D = ['------------'];
    disp(D);
end

