# frozen_string_literal: true

# Class
class Organization
  attr_reader :classes, :name, :answers

  def initialize(classes, name, answers)
    @classes = classes
    @name = name
    @answers = answers
  end
end
