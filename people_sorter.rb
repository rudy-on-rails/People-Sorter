class PeopleSorter
  def initialize(people_array)
    @people_array = people_array.clone
  end

  def sort_in_groups_of(number_of_people_for_each_group)
    raise ArgumentError, "Number to divide cant be greater than number of people!" unless @people_array.count >= number_of_people_for_each_group
    sorted_people_result = []
    while @people_array.count > 0
      sorted_people_result << @people_array.sample(number_of_people_for_each_group)
      @people_array.reject!{|p| sorted_people_result.flatten.include?(p)}
    end
    sorted_people_result
  end
end