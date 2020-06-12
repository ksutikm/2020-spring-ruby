# frozen_string_literal: true

require_relative 'book'

# The class that contains all our book
class BookList
  def initialize(books = [])
    @books = books.map do |book|
      [book.id, book]
    end.to_h
  end

  def all_books
    @books.values
  end

  def book_by_id(id)
    @books[id]
  end

  def add_book(parameters)
    book_id = if @books.empty?
                1
              else
                @books.keys.max + 1
              end
    book = new_book(parameters, book_id)
    @books[book_id] = book
    book
  end

  def new_book(parameters, book_id)
    book = Book.new(
      id: book_id,
      author: parameters[:author],
      title: parameters[:title],
      inverted_number: parameters[:inverted_number],
      genre: parameters[:genre],
      age_rating: parameters[:age_rating],
      number_in_library: parameters[:number_in_library],
      number_on_hands: 0
    )
    book
  end

  def add_real_book(book)
    @books[book.id] = book
  end

  def update_book(book_id, parameters)
    book = @books[book_id]
    book.author = parameters[:author]
    book.title = parameters[:title]
    book.inverted_number = parameters[:inverted_number]
    book.genre = parameters[:genre]
    book.age_rating = parameters[:age_rating]
    book.number_in_library = parameters[:number_in_library]
  end

  def delete_book(book_id)
    @books.delete(book_id)
  end
end
