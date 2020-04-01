count_success = 0
count_failure = 0
a = 0.0
print "Введите данные: "
while line = gets
  line = line.strip
  if line == "99.999"
    break
  end
  a = line.to_f
  if a == 0 or a < 0
    puts "Ошибочный ввод"
    count_success += 1
  else
    puts "Правильный ввод", "#{a}"
    count_failure += 1
  end
  print "Введите данные: "
end
puts "", "Количество успешных вводов: #{count_success}", "Количество ошибочных вводов: #{count_failure}"
