# frozen_string_literal: true

require_relative 'book_return'

# The class that contains all our book
class BookReturnList
  def initialize(books_return = [])
    @books_return = books_return.map do |book|
      [book.id, book]
    end.to_h
  end

  def all_books_return
    @books_return.values
  end

  def book_return_by_id(id)
    @books_return[id]
  end

  def upgrade_book_list(book_list, list_books)
    book_list.each do |key, value|
      value.each do |book|
        id_number = if @books_return.empty?
                      1
                    else
                      @books_return.keys.max + 1
                    end
        @books_return[id_number] = BookReturn.new(
          id: id_number,
          date: key,
          book: list_books.book_by_id(book)
        )
      end
    end
  end
end
