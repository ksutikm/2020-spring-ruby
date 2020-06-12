# frozen_string_literal: true

require 'psych'
require_relative 'book_list'
require_relative 'book'

# Storage for all of our data
class Store
  attr_reader :book_list, :reader_list

  DATA_BOOK_STORE = File.expand_path('../db/data_book.yaml', __dir__)
  DATA_READER_STORE = File.expand_path('../db/data_reader.yaml', __dir__)

  def initialize
    @book_list = BookList.new
    @reader_list = ReaderList.new
    read_data_book
    read_data_reader
    at_exit { write_data }
  end

  def read_data_book
    return unless File.exist?(DATA_BOOK_STORE)

    yaml_data = File.read(DATA_BOOK_STORE)
    raw_data = Psych.load(yaml_data, symbolize_names: true)
    raw_data[:book_list].each do |raw_book|
      @book_list.add_real_book(Book.new(**raw_book))
    end
  end

  def read_data_reader
    return unless File.exist?(DATA_READER_STORE)

    yaml_data = File.read(DATA_READER_STORE)
    raw_data = Psych.load(yaml_data, symbolize_names: true)
    raw_data[:reader_list].each do |raw_reader|
      @reader_list.add_real_reader(Reader.new(**raw_reader))
    end
  end

  def write_data
    raw_books = @book_list.all_books.map(&:to_h)
    yaml_data = Psych.dump({
                             book_list: raw_books
                           })
    File.write(DATA_BOOK_STORE, yaml_data)
    raw_readers = @reader_list.all_readers.map(&:to_h)
    yaml_data = Psych.dump({
                             reader_list: raw_readers
                           })
    File.write(DATA_READER_STORE, yaml_data)
  end
end
