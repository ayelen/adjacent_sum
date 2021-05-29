def equal_sum_adjacent_tupla(a)
  return 0 if a.nil? || a.empty?
  array_modified = prepare_data(a)
  calculate_max_num(array_modified)
end

def prepare_data(a)
  a = a.length.even? ? a : (a << 0)
  a = (a + a.drop(1)).each_slice(2).to_a
  a.map{ |elem| elem[0] + (elem[1] || 0) }.flatten
end

def calculate_max_num(array_modified)
  prev_value = -1
  current_sum = 1
  max_sum = 1
  array_modified.each do |v|
    if v == prev_value
      current_sum += 1
    else
      max_sum = current_sum if current_sum > max_sum
      current_sum = 1
    end
    prev_value = v
  end

  max_sum
end

puts "For array [1,6,3,4,2,5,6,1] should 4: #{equal_sum_adjacent_tupla([1,6,3,4,2,5,6,1])}"
puts "For array [1,2,2,3,3,4,4,5,5,6,6,7] should 1: #{equal_sum_adjacent_tupla([1,2,2,3,3,4,4,5,5,6,6,7])}"
puts "For array nil should be 0: #{equal_sum_adjacent_tupla(nil)}"
puts "For an empty array should be 0: #{equal_sum_adjacent_tupla([])}"
