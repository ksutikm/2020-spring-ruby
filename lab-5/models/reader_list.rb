# frozen_string_literal: true

require_relative 'reader'

# The class that contains all our reader
class ReaderList
  def initialize(readers = [])
    @readers = readers
  end
end
