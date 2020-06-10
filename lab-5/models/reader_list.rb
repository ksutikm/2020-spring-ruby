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
end
