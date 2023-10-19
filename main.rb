
def main
  menu = {
    "1" => "List all books",
    "2" => "List all people",
    "3" => "Create a person",
    "4" => "Create a book",
    "5" => "Create a rental",
    "6" => "List all rentals for a given person ID",
    "7" => "Quit"
  }

  puts "Welcome to the Book Rental App!"
  puts "What would you like to do?"

  menu.each do |key, value|
    puts "#{key}: #{value}"
  end

  option = gets.chomp
  while option != "7"
    case option
    when "1"
      list_all_books
    when "2"
      list_all_people
    when "3"
      person_type = "teacher"
      puts "What type of person would you like to create? (teacher/student)"
      person_type = gets.chomp
      create_person(person_type)
    when "4"
      create_book
    when "5"
      create_rental
    when "6"
      puts "Enter the person's ID:"
      person_id = gets.chomp.to_i
      list_all_rentals_for_person(person_id)
    else
      puts "Invalid option"
    end

    puts "What would you like to do next?"
    option = gets.chomp
  end

  puts "Goodbye!"
end
