require "tty-prompt"
require_relative "..\lib\train.rb"
require_relative "..\lib\station.rb"

def main
  prompt = TTY::Prompt.new
  choices = ["Вывести расписание движения поездов", "Вывести список поездов, отсортировав их по количеству реальных остановок", "Завершить работу приложения"]
  case prompt.select("Выберите действие", choices)
  when choices[0]
  when choices[1]
  when choices[2]
  end

  reader = TrainReader.new
  trains = reader.read_in_trains("..\data\stop.csv")
  stations = reader.read_stations("..\data\stations.csv")
  pp trains
  pp stations
end

if __FILE__ == $0
  main
end
