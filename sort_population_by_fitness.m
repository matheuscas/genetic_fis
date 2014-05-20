function sorted_population = sort_population_by_fitness( population )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

[temp, order] = sort([population(:).fitness],'descend');
sorted_population = population(order);
end

