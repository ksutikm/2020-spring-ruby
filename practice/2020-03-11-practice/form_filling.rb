#rubi form_filling.rb -h

require "optparse"
require "ostruct"

def main
  if ARGV.length == 1
    puts "Приложение подбирает работу для вас на основании введённых данных"
  end
  options = OpenStruct.new
  OptionParser.new do |opt|
    opt.on("-n", "--name NAME", "The first name") { |o| options.name = o }
    opt.on("-s", "--surname SURNAME", "The last name") { |o| options.surname = o }
    opt.on("-m", "--mail MAIL") { |o| options.mail = o }
    opt.on("-a", "--age AGE") { |o| options.age = o }
    opt.on("-e", "--experience EXPERIENCE") { |o| options.experience = o }
  end.parse!

  profession = ""
  if options.name == "Petr" and options.surname == "Petrovich"
    profession.concat("Руководитель\n")
  end
  if options.mail.include? "code"
    profession.concat("Инженер\n")
  end
  if options.experience.to_i < 2
    profession.concat("Стажёр\n")
  end
  if options.age.to_i > 45 and options.age.to_i < 60
    profession.concat("Бывалый\n")
  end
  if options.experience.to_i > 15
    profession.concat("Профессионал\n")
  end
  if options.experience.to_i > 5
    profession.concat("Известный\n")
  end

  puts "Возможные профессии:\n"
  puts profession
end

if __FILE__ == $0
  main
end
