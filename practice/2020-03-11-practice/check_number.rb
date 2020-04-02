def h(a)
  a.to_f
end

def help()
  puts "Данное приложение производит проверку числа. Передайте число в качестве первого аргумента приложения.
  
    check_number.rb NUMBER
    "
end

def main
  b = h(ARGV[0])

  if b > 0
    puts "Число '#{b}' положительное"
  elsif b < 0
    puts "Число '#{b}' не положительное, а отрицательное число"
  else
    puts "непонятное число"
  end
end

if __FILE__ == $0
  if ARGV.length == 0
    help
  else
    main
  end
end
