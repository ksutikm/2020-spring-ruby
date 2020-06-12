# frozen_string_literal: true

require 'date'

require_relative 'reader'

# The class that contains all our reader
class ReaderList
  def initialize(readers = [])
    @readers = readers.map do |reader|
      reader.age = age_in_completed_years(reader.date_of_birth, Date.today.to_date)
      [reader.id, reader]
    end.to_h
  end

  def age_in_completed_years(date_one, date_two)
    # Difference in years, less one if you have not had a birthday this year.
    a = date_two.year - date_one.year
    a -= 1 if
         (date_one.month > date_two.month) ||
         ((date_one.month >= date_two.month) && (date_one.day > date_two.day))
    a
  end

  def all_readers
    @readers.values
  end

  def reader_by_id(id)
    @readers[id]
  end

  def add_real_reader(reader)
    reader.age = age_in_completed_years(reader.date_of_birth, Date.today.to_date)
    @readers[reader.id] = reader
  end

  def add_reader(parameters)
    reader_id = if @readers.empty?
                  1
                else
                  @readers.keys.max + 1
                end
    reader = new_reader(parameters, reader_id)
    @readers[reader_id] = reader
    reader
  end

  def new_reader(parameters, reader_id)
    reader = Reader.new(
      id: reader_id,
      last_name: parameters[:last_name],
      name: parameters[:name],
      middle_name: parameters[:middle_name],
      date_of_birth: parameters[:date_of_birth],
      list_of_book_on_hands: {},
      age: age_in_completed_years(parameters[:date_of_birth], Date.today.to_date)
    )
    reader
  end
end
