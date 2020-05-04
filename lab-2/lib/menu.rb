# frozen_string_literal: true

require 'tty-prompt'
require 'pathname'
require_relative 'organization'
require_relative 'organization_list'

# The main class of our application
class Menu
  attr_reader :org_list

  def initialize
    @prompt = TTY::Prompt.new
    @org_list = OrganizationList.new
  end

  MAIN_MENU_CHOICES = [
    { name: 'Список двоишников', value: :v1 },
    { name: 'Статистика тестирования', value: :v2 },
    { name: 'Пересчет оценок', value: :v3 },
    { name: 'Проверка на списывание', value: :v4 },
    { name: '3 самых сложных вопроса', value: :v5 },
    { name: 'Завершить работу приложения', value: :exit }
  ].freeze

  def create_menu
    path_name = Pathname.new(File.expand_path('../data/test_results.csv', __dir__))
    puts 'Нет файла' unless path_name.exist?
    @org_list = @org_list.reader_data(path_name)
  end

  def show_menu
    loop do
      action = @prompt.select('Выберите действие', MAIN_MENU_CHOICES)
      break if action == :exit

      show_two_marks if action == :v1
      show_difficult if action == :v5
    end
  end


  def show_difficult
    
  end

  def show_two_marks
    g = []
    org_list.each do

    end
  end
end
