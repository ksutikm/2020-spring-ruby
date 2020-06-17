# frozen_string_literal: true

require 'date'

# List of books for to  give
module Calculation
  def self.calculate_penalty(raw_date)
    date = Date.parse(raw_date.to_s)
    (Date.today - date).to_i
  end

  def self.calculate_date(date1, date2)
    (Date.parse(date2.to_s) - Date.parse(date1.to_s)).to_i
  end

  def self.calculate_penalty_result(penalty)
    "Ваш штраф: #{penalty} руб."
  end

  def self.delete_book_in_reader(book_list, date, id_book)
    list = delete_id_book(book_list[date], id_book)
    pp list
    book_list[date] = list
    book_list.delete(date) if book_list[date] == []
    book_list
  end

  def self.delete_id_book(list, id_book)
    cur1 = []
    cur2 = []
    list.each do |id|
      if id != id_book
        cur1.append(id)
      else
        cur2.append(id)
      end
    end
    cur1 += cur2[0, cur2.size - 1]
    cur1
  end

  def self.list_genre(books, genre)
    books.select { |book| genre.eql?(book.genre) }
         .sort { |book1, book2| book1.author <=> book2.author }
  end

  def self.delinquency_books(readers, date)
    unique_books = []
    readers.each do |reader|
      books = reader.list_of_book_on_hands
      books.each do |key, value|
        unique_books += value if calculate_date(key, date).positive?
      end
    end
    unique_books.uniq
  end

  def self.books_for_id(books, book_list)
    final_list = []
    books.each do |id|
      final_list.append(book_list.book_by_id(id))
    end
    final_list
  end
end
