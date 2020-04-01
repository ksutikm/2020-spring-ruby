print "Введите данные: "
while line = gets
  line = line.strip
  if line == "stop, please"
    break
  end
  puts line
  pp line
  p line
  print "Введите данные: "
end
