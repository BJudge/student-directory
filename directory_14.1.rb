# let's put all students into an array
@cohort = ["onsite", "offsite"]
@students = [] # an empty array accessible to all methods


# 1. print the menu and ask the user what to do
  def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
  end

  def show_students
    print_header
    print_students_list
    print_footer
  end


    # 3. do what the user has asked
  def process(selection)
    case selection
     when "1"
      input_students
    # input the students
     when "2"
    # show the students
        show_students
      when "3"
        save_students
      when "4"
        load_students
     when "9"
    exit # this will cause the program to terminate
     else
    puts "I don't know what you meant, try again"
    end
  end

  def interactive_menu
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
  end

  def show_students
    print_header
    print_students_list
    print_footer
  end

def input_students
    # create an empty array

  name = 'bart'
  default = 'Not Supplied'
      # until the name is  empty, repeat this code
  until name.empty?
    # add the student hash to the array
        # get another name from the user
    puts "Please enter student name"
    name = STDIN.gets.gsub(/\n/,'')
    break if name.empty?
    puts "what is your favorite hobby?"
    hobby = STDIN.gets.gsub(/\n/,'')
    puts "what is your height?"
    height = STDIN.gets.gsub(/\n/,'')
    puts "what is the name of the cohort your joining?"
    cohort_name = STDIN.gets.gsub(/\n/,'')
    if cohort_name.empty? || !@cohort.include?(cohort_name)
       cohort_name = default
     end
    puts "what date does your cohort start?"
    cohort_start = STDIN.gets.gsub(/\n/,'')
    if cohort_start.empty?
       cohort_start = default
     end
    puts 'To finish, just hit return twice'
    # the below shovels the above inputs into the array
    add_student(name, cohort_name)
   case @students.count
   when 1
    puts "Now we have #{@students.count} student"
  else
    puts "Now we have #{@students.count} students"
  end

   end
  # return the array of students
  @students
end

def print_by_cohort
  cohort_type = []
  puts "search by onsite or offsite"
  setting = STDIN.gets.gsub(/\n/,'')
  @students.map do |student|
    if student[:cohort_name] == setting
      cohort_type << [student[:name], student[:cohort_name], student[:cohort_start]]
    end
  end

  cohort_type.each do |cohort|
    puts cohort.join(" ")
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort_name], student[:cohort_start], student[:hobby], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort_name = line.chomp.split(',')
    add_student(name, cohort_name)
  end
  file.close
end


def print_header
  puts "The student of Villains Academy"
  puts "----------".center(20,'--')
end

def print_students_list

  index_counter = 0

  while @students.length > index_counter
    puts   "#{index_counter +1}.".to_s.rjust(5,'--') +" #{@students[index_counter][:name].capitalize.ljust(20,'--')}"
    puts "#{@students[index_counter] [:cohort_name]}"

    index_counter += 1
  end

  def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end




def print_footer
  puts "Overall, we have #{@students.count} great students"
end
end

def add_student(name, cohort_name)
   @students << {name: name, cohort_name: cohort_name}
end

#nothing happens until we call the methods

interactive_menu
