# let's put all students into an array
def input_students
    # create an empty array
  students = []
  name = 'bart'
    # until the name is  empty, repeat this code
  until name.empty?
    # add the student hash to the array
        # get another name from the user
    puts "Please enter student name"
    name = gets.chomp
    break if name.empty?
    puts "what is your favorite hobby?"
    hobby = gets.chomp
    puts "what is your height?"
    height = gets.chomp
    puts 'To finish, just hit return twice'
    # the below shovels the above inputs into the array
    students << {name: name, cohort: :November, hobby: hobby, height: height}
    puts "Now we have #{students.count} students"
   end
  # return the array of students
  students
end

def print_header
  puts "The student of Villains Academy"
  puts "----------".center(20,'--')
end

def print(students)
  index_counter = 0
  while students.length > index_counter
    puts   "#{index_counter +1}.".to_s.rjust(5,'--') +" #{students[index_counter][:name].capitalize.ljust(20,'--')}"
     puts "#{students[index_counter][:cohort].to_s.rjust(10,'--')}"+ " cohort".ljust(10,'--')
     puts "#{students[index_counter][:hobby].center(20,'--')}"
     puts "#{students[index_counter][:height].center(20,'--')}"
    index_counter += 1
  end
end

students = input_students


def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end


#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
