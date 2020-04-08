# frozen_string_literal: true

class Train
  def initialize
    @trains = []
  end

  def add_train(train_in_stock)
    @trains.append(train_in_stock)
  end
end
