function child = crossover( individual_1,individual_2, rate)
%crossover make a two point crossover between two individuals and returns
%a child individual

    if randi([0 100]) <= rate

        individual_1_size = size(individual_1);
        individual_1_size = individual_1_size(2);

        max_first_point_index = (individual_1_size - 2);
        first_point_index = randi([1 max_first_point_index]);

        second_point_index = randi([(first_point_index + 2) individual_1_size]);

        first_part_child = individual_1(1:first_point_index);
        second_part_child = individual_2((first_point_index + 1):second_point_index);
        third_part_child = individual_1((second_point_index + 1):individual_1_size);

        child = horzcat(first_part_child,second_part_child,third_part_child);

    else
        choice = randi([0 1]);
        if choice == 0
            child = individual_1;
        else
            child = individual_2;
        end        
    end    

end
