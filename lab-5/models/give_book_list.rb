# frozen_string_literal: true

# List of books for to  give
module GiveBookList
  def self.book_list_for_given(books_list)
    give_book = books_list
    give_books = []
    give_book.each do |book|
      give_books.push(name_string(book))
    end
    give_books
  end

  def self.name_string(book)
    "#{book.author} '#{book.title}'"
  end

  def self.find_book(book_string, books)
    the_book = []
    books.each do |book|
      the_book.push(book.id) if name_string(book).eql?(book_string)
    end
    the_book
  end

  def self.add_book_in_list(reader, book_id, raw_date)
    date = (raw_date + 14).to_s
    book_list = reader.list_of_book_on_hands
    flag = 'no'
    book_list.each do |key, _value|
      flag = key if date.eql?(key.to_s)
    end
    if !flag.eql?('no')
      book_list[flag].append(book_id)
    else
      book_list[date] = [book_id]
    end
    book_list
  end

  def self.reader_book_list(books, reader_books)
    new_hash = {}
    reader_books.each do |key, value|
      new_hash[key.to_s] = []
      value.each do |book|
        foo = name_string(books.book_by_id(book))
        new_hash[key.to_s].append(foo)
      end
    end
    new_hash
  end

  def self.delete_books_in_reader(reader, book_id)
    new_hash = {}
    hash = {}
    reader.each do |key, value|
      new_hash[key] = []
      value.each do |id|
        new_hash[key].append(id) if book_id != id
      end
      hash[key] = new_hash[key] if new_hash[key] != []
    end
    hash
  end
end
