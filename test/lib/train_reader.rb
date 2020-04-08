# frozen_string_literal: true

require "csv"

require_relative "train_in_stock"
require_relative "train"
require_relative "station_in_stock"
require_relative "station"

class TrainReader
  def read_in_trains(*filenames)
    trains = Train.new
    filenames.each do |filename|
      CSV.foreach(filename, headers: true) do |row|
        trains.add_train(TrainInStock.new(
          row["TRAINID"],
          Integer(row["NUMBER"]),
          Integer(row["STATION_CODE"]),
          row["ARRIVAL_TIME"],
          Integer(row["STOP_DURATION"]),
          Integer(row["DISTANCE"])
        ))
      end
    end
    trains
  end

  def read_stations(*filenames)
    stations = Station.new
    filenames.each do |filename|
      CSV.foreach(filename, headers: true) do |row|
        stations.add_station(StationInStock.new(
          Integer(row["CODE"]),
          row["TITLE"]
        ))
      end
    end
    stations
  end
end

reader = TrainReader.new
trains = reader.read_in_trains("..\data\stop.csv")
stations = reader.read_stations("..\data\stations.csv")
pp trains
pp stations
