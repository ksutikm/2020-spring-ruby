# frozen_string_literal: true

class StationInStock
  attr_reader :code, :title

  def initialize(code, title)
    @code = code
    @title = title
  end
end
