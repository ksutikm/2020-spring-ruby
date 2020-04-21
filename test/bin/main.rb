require 'tty-prompt'
require_relative '../lib/train.rb'
require_relative '../lib/station.rb'

def main
  # prompt = TTY::Prompt.new
  # choices = ["Вывести расписание движения поездов", "Вывести список поездов, отсортировав их по количеству реальных остановок", "Завершить работу приложения"]
  # a = prompt.select("Выберите действие", choices)
  # case 
  # when choices[0]
  # when choices[1]
  # when choices[2]
  # end

  trains = Train.new
  trains.create

end

if __FILE__ == $0
  main
end
