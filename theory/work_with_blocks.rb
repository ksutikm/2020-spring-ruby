sum = 0
[1, 2, 3, 4].each do |value|
  square = value * value
  sum += square
end
puts sum

value = "some shape"
[1, 2].each { |value| puts value }
puts value

square = "some shape"
sum = 0
[1, 2, 3, 4].each do |value; square|
  square = value * value # локальная переменная
  sum += square
end
puts sum
puts square
