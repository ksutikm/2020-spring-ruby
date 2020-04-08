# frozen_string_literal: true

class TrainInStock
  attr_reader :trainid, :number, :station_code, :arrival_time, :stop_durattion, :distance

  def initialize(trainid, number, station_code, arrival_time, stop_durattion, distance)
    @trainid = trainid
    @number = number
    @station_code = station_code
    @arrival_time = arrival_time
    @stop_durattion = stop_durattion
    @distance = distance
  end
end
