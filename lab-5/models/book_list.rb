# frozen_string_literal: true

require_relative 'book'

# The class that contains all our book
class BookList
  def initialize(books = [])
    @books = books
  end
end