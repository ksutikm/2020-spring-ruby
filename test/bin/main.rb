require "tty-prompt"

def main
  prompt = TTY::Prompt.new
  choices = ["Вывести расписание движения поездов", "Вывести список поездов, отсортировав их по количеству реальных остановок", "Завершить работу приложения"]
  case prompt.select("Выберите действие", choices)
  when choices[0]
  when choices[1]
  when choices[2]
  end
end

if __FILE__ == $0
  main
end
