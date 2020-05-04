# frozen_string_literal: true

require 'csv'

# Class
class OrganizationList
  def initialize(arr = [])
    @arr = arr
  end

  def each_org
    @arr.each do |arr|
      yield arr
    end
  end

  def reader_data(filename)
    CSV.foreach(filename, encoding: 'utf-8') do |row|
      @arr.append(Organization.new(row[0], row[1], row[2]))
    end
    @arr
  end
end
