def print_header
 puts 'The students of my cohort at Makers Academy'
  puts '-------------'
end
def print(students)
students.map do |student|
  name = student[:name][0]
  if name.start_with?('j', 'J')
    puts "#{student[:name].upcase} (#{student[:cohort]} cohort)"
  end
end
end
def print_footer(names)
 puts "Overall, we have #{names.count} great students"
end
def input_students
 puts "Please enter the names of the students"
 puts "To finish, just hit return twice"
 # create an empty array
 students = []
 # get the first name
 name = gets.chomp
 while !name.empty? do
   students << {name: name, cohort: :november}
   puts "Now we have #{students.count} students"
   name = gets.chomp
 end
 students
end
students = input_students
print_header
print(students)
print_footer(students)
