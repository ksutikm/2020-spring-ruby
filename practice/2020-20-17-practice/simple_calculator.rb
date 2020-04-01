a = 0.0
print "Введите данные: "
while line = gets
  line = line.strip
  if line == "over"
    break
  end
  puts line, "Текущая сумма = #{a += line.to_f}"
  print "Введите данные: "
end
puts "", "Результат сложения чисел: #{a}"
