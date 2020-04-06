require "json"
require_relative "auto"
require_relative "fleet"

def main
  fleet = Fleet.new
  fleet.load_from_file("cars-list.json")
  puts fleet.consumption_by_brand("BMW")
  puts fleet.number_by_model("A5 2,0i")
  puts fleet.number_by_brand("BMW")
  puts fleet.average_consumption
end

if __FILE__ == $0
  main
end
