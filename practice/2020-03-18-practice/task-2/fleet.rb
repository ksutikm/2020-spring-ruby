require "json"
require_relative "auto"

class Fleet
  attr_reader :cars

  def initialize
    @cars = Array.new
  end

  def add(car)
    @cars.append(car)
  end

  def load_from_file(file_name)
    json_data = File.read(file_name)
    ruby_objects = JSON.parse(json_data)
    ruby_objects.map do |ruby_objects|
      element = Auto.new(ruby_objects["mark"], ruby_objects["model"], ruby_objects["year"], ruby_objects["consumption"])
      add(element)
    end
  end

  def average_consumption
    sum = @cars.reduce(0.0) { |sum, car| sum += car.gasoline_consumption }
    sum / @cars.size
  end

  def number_by_brand(brand)
    @cars.reduce(0) { |sum, car| sum += car.brand == brand.encode("UTF-8") ? 1 : 0 }
  end

  def number_by_model(model)
    @cars.reduce(0) { |sum, car| sum += car.model == model.encode("UTF-8") ? 1 : 0 }
  end

  def consumption_by_brand(brand)
    sum, count = 0.0, 0
    @cars.map do |car|
      if car.brand == brand.encode("UTF-8")
        count, sum = count + 1, sum + car.gasoline_consumption
      end
    end
    sum / count
  end
end
