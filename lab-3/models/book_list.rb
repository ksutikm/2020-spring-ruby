# frozen_string_literal: true

require 'forwardable'

# The list of books to manage
class BookList
  extend Forwardable
  def_delegator :@books, :each, :each_book

  def initialize(books = [])
    @books = books
  end

  def add_book(book)
    @books.append(book)
  end

  def all_books
    @books.dup
  end

  def sorted
    @books.sort.reverse
  end

  def years
    h = {}
    @books.each do |book|
        y = book.book_year
        if h.has_key?(y)
            h[y].append(book)
        else
            h[y] = [book]
        end
    end
    h
  end

  def filter(formatt)
    @books.select do |book|
      next if !formatt.empty? && !book.format.include?(formatt)
      true
    end
  end

  def likes
    @books.select do |book|
      next if book.estimation.to_i == 10
      true
    end
  end
end
