# frozen_string_literal: true

class Station
  attr_reader :stations

  def initialize
    @stations = []
  end

  def add_station(station_in_stock)
    @stations.append(station_in_stock)
  end
end
