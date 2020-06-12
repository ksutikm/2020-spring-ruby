# frozen_string_literal: true

require_relative 'reader'

# The class that contains all our reader
class ReaderList
  def initialize(readers = [])
    @readers = readers.map do |reader|
      [reader.id, reader]
    end.to_h
  end

  def all_readers
    @readers.values
  end

  def reader_by_id(id)
    @readers[id]
  end

  def add_real_reader(reader)
    @readers[reader.id] = reader
  end

  def add_reader(parameters)
    reader_id = if @readers.empty?
                  1
                else
                  @readers.keys.max + 1
                end
    reader = Reader.new(
      id: reader_id,
      last_name: parameters[:last_name],
      name: parameters[:name],
      middle_name: parameters[:middle_name],
      date_of_birth: parameters[:date_of_birth],
      list_of_book_on_hands: {}
    )
    @readers[reader_id] = reader
    reader
  end
end
