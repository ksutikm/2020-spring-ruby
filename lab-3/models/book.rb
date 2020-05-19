# frozen_string_literal: true

# Class Book
class Book
  attr_reader :author, :name, :date

  def initialize(author, name, date)
    @author = author
    @name = name
    @date = date
  end

  def <=>(other)
    d1 = @date.split('-')
    d2 = other.date.split('-')
    res = if (d1[0] == d2[0]) && (d1[1] == d2[1]) && (d1[2] == d2[2])
            0
          elsif (d1[0] < d2[0]) && (d1[1] < d2[1]) && (d1[2] < d2[2])
            -1
          else
            1
          end
  end

  def book_year
    d = @date.split('-')
    d[0]
  end

  def book_month
    d = @date.split('-')
    d[1].to_i
  end
end
