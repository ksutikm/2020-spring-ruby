# frozen_string_literal: true

# Validators for the incoming requests
module InputValidators
  def self.check_given_book(book, reader)
    errors = [].concat(check_age_rating(book, reader))
               .concat(check_book_in_library(book))
    {
      errors: errors
    }
  end

  def self.check_age_rating(book, reader)
    error = if reader.age >= book.age_rating.to_i
              []
            else
              ['Возрастной рейтинг книги не соответсвует возрасту читателя']
            end
    error
  end

  def self.check_book_in_library(book)
    error = if book.number_in_library.zero?
              ['В библиотеке нет свободных экзмепляров']
            else
              []
            end
    error
  end
end
