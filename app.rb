require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :menu, :books, :people, :rentals

  def initialize(menu)
    @menu = menu
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts books.empty? ? 'No books have been added!' : books.map { |book| "Title: #{book.title}, Author: #{book.author}" }
    menu.show_menu
  end

  def list_all_people
    puts people.empty? ? 'No people have been added!' : people.map { |person| "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    menu.show_menu
  end

  def create_student
    print 'Enter student age: '
    age = gets.chomp.to_i
    print 'Enter student name: '
    name = gets.chomp
    print 'Does the student have parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    print 'Enter student classroom: '
    classroom = gets.chomp
    @people.push(Student.new(name: name, age: age, parent_permission: parent_permission, classroom: classroom))
    puts 'Student created successfully'
    @menu.show_menu
  end

  def create_teacher
    print 'Enter the age of the teacher: '
    age = gets.chomp.to_i
    print 'Enter the name of the teacher: '
    name = gets.chomp
    print 'Enter the specialization of the teacher: '
    specialization = gets.chomp
    @people.push(Teacher.new(name: name, age: age, specialization: specialization))
    puts 'Teacher created successfully'
    @menu.show_menu
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)? [Enter the corresponding number]'
    person = gets.chomp
    case person
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please enter either 1 or 2!'
    end

    @menu.show_menu
  end

  def create_book
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter the author of the book: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
    @menu.show_menu
  end

  def create_rental
    puts 'Select a book from the following list by entering its corresponding number:'
    @books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
    book_number = gets.chomp.to_i
    puts

    puts 'Select a person from the following list by entering their corresponding number:'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_number = gets.chomp.to_i

    print 'Enter the rental date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, @books[book_number], @people[person_number]))
    puts 'Rental created successfully'

    @menu.show_menu
  end

  def list_all_rentals
    print 'Enter the ID of the person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
    @menu.show_menu
  end

  def exit
    puts 'Thank you for using the app!'
  end
end
