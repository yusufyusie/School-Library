class App
  def initialize(menu)
    @menu = menu
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts "Here is a list of all books:"
    @books.each do |book|
      puts book.to_s
    end
  end

  def list_all_people
    puts "Here is a list of all people:"
    @people.each do |person|
      puts person.to_s
    end
  end

  def create_person(person_type)
    puts "Enter the person's name:"
    name = gets.chomp

    puts "Enter the person's age:"
    age = gets.chomp.to_i

    if person_type == "teacher"
      @people << Teacher.new(name, age)
    elsif person_type == "student"
      @people << Student.new(name, age)
    else
      raise "Invalid person type"
    end
  end

  def create_book
    puts "Enter the book's title:"
    title = gets.chomp

    puts "Enter the book's author:"
    author = gets.chomp

    puts "Enter the book's genre:"
    genre = gets.chomp

    @books << Book.new(title, author, genre)
  end

  def create_rental
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i

    puts "Enter the book's ID:"
    book_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }
    book = @books.find { |b| b.id == book_id }

    @rentals << Rental.new(person, book)
  end

  def list_all_rentals_for_person(person_id)
    puts "Here is a list of all rentals for person with ID #{person_id}:"
    rentals = @rentals.select { |r| r.person.id == person_id }

    rentals.each do |rental|
      puts rental.to_s
    end
  end
end
