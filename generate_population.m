function population = generate_population(nvars, nelems, max_range)
%generate_population - generates a population of nelems, with nvars and
%each cromosome in range of 1 to max_range (integer values)
%   nvars - quantity of variables (size of cromossome)
%   nelems - quantity of individuals
%   max_range - max value of each cromossome can take
%   population - array of structs with code (cromossome) and fitness zero


population = struct('code','', 'fitness',0);
for i = 1:nelems
    population(i) = struct('code',randi(max_range,1,nvars),'fitness',0);
end
    
    

