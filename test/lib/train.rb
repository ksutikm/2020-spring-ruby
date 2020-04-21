# frozen_string_literal: true
require_relative '../data/stops.csv'
require_relative 'train_reader'

class Train
  def initialize
    @trains = []
  end

  def add_train(train_in_stock)
    @trains.append(train_in_stock)
  end

  def create
    reader = TrainReader.new
    
  end
end
