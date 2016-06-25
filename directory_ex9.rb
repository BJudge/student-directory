# let's put all students into an array
@cohort = ["onsite", "offsite"]
def input_students
    # create an empty array
  students = []
  name = 'bart'
  default = 'Not Supplied'
      # until the name is  empty, repeat this code
  until name.empty?
    # add the student hash to the array
        # get another name from the user
    puts "Please enter student name"
    name = gets.gsub(/\n/,'')
    break if name.empty?
    puts "what is your favorite hobby?"
    hobby = gets.gsub(/\n/,'')
    puts "what is your height?"
    height = gets.gsub(/\n/,'')
    puts "what is the name of the cohort your joining?"
    cohort_name = gets.gsub(/\n/,'')
    if cohort_name.empty? || !@cohort.include?(cohort_name)
       cohort_name = default
     end
    puts "what date does your cohort start?"
    cohort_start = gets.gsub(/\n/,'')
    if cohort_start.empty?
       cohort_start = default
     end
    puts 'To finish, just hit return twice'
    # the below shovels the above inputs into the array
    students << {name: name, cohort_name: cohort_name, cohort_start: cohort_start, hobby: hobby, height: height}
   case students.count
   when 1
    puts "Now we have #{students.count} student"
  else
    puts "Now we have #{students.count} students"
  end

   end
  # return the array of students
  students
end

def print_by_cohort(students)
  cohort_type = []
  puts "search by onsite or offsite"
  setting = gets.gsub(/\n/,'')
  students.map do |student|
    if student[:cohort_name] == setting
      cohort_type << [student[:name], student[:cohort_name], student[:cohort_start]]
    end
  end

  cohort_type.each do |cohort|
    puts cohort.join(" ")
  end
end


def print_header
  puts "The student of Villains Academy"
  puts "----------".center(20,'--')
end

def print(students)
  index_counter = 0
  while students.length > index_counter
    puts   "#{index_counter +1}.".to_s.rjust(5,'--') +" #{students[index_counter][:name].capitalize.ljust(20,'--')}"
     puts "#{students[index_counter] [:cohort_name]}"
     puts "#{students[index_counter][:cohort_start].capitalize.rjust(10,'--')}"+ " cohort".ljust(10,'--')
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
print_by_cohort(students)
print_footer(students)
