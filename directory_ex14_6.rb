@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a chosen file"
  puts "4. Load the list from a chosen file"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    user_options(STDIN.gets.chomp)
  end
end

def user_options(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "9" then exit # this will cause the program to terminate
    when "3" then save_students
    when "4" then loading_saved_file
    else puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Input students selected"
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  puts "Please enter cohort name"
  cohort = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_students(name,cohort)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end


def show_students
  puts "Showing students"
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  puts "Printing students"
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "What file would you like to save to?"
  name_of_file_to_save = gets.chomp
  puts "Saving students"
  # open the file for writing
  File.open(name_of_file_to_save, "w") do |file|
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
end
end

def load_students(filename)

    puts "Loading students"

  File.open(filename, "r") do |file|
  #file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_students(name,cohort)
  end
end
end

def loading_saved_file
  puts "what file would you like to load from?" # load students.csv as default
    filename = gets.chomp

  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def add_students(name,cohort)
  @students << {name: name, cohort: cohort}
end

loading_saved_file
interactive_menu
