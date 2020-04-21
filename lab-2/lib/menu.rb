# frozen_string_literal: true

require 'tty-prompt'

# The main class of our application
class Menu
  def initialize
    @prompt = TTY::Prompt.new
    @train_list = DataReader.read_trains
  end

  MAIN_MENU_CHOICES = [
    { name: 'Вывести расписание движения поездов', value: :rasp },
    { name: 'Вывести список поездов, по количеству реальных остановок',
      value: :stops },
    { name: 'Завершить работу приложения', value: :exit }
  ].freeze

  def show_menu
    loop do
      action = @prompt.select('Выберите действие', MAIN_MENU_CHOICES)
      break if action == :exit

      show_rasp if action == :rasp
      show_stops if action == :stops
    end
  end

  def show_rasp
    train = @prompt.select('Выберите поезд') do |menu|
      @train_list.each_train do |train_choice|
        menu.choice(train_choice, train_choice)
      end
    end
    train.each_stop.with_index do |stop, index|
      puts "#{index + 1}: #{stop}"
    end
  end

  def show_stops
    @train_list.each_train_by_length do |train|
      puts "Остановки: #{train.stop_count} Маршрут: #{train}"
    end
  end
end