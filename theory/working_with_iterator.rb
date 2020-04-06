def fib_up_to(max)
  i1, i2 = 1, 1 # Паралельное присваивание
  while i1 <= max
    yield i1
    i1, i2 = i2, i1 + i2
  end
end

fib_up_to(1000) { |f| print f, " " }
puts "\n\n"

[1, 3, 5, 7].reduce(0) { |sum, element| sum + element }
[1, 3, 5, 7].reduce(1) { |product, el| product * el }

# Можно не указывать начальное значение, тогда первый элемент массива — начальное значение
[1, 3, 5, 7].reduce { |sum, element| sum + element }
[1, 3, 5, 7].reduce { |product, el| product * el }

# Можно просто указать метод, который необходимо вызывать у элементов массива
[1, 3, 5, 7].reduce(:+) # => 16
[1, 3, 5, 7].reduce(:*) # => 105

(1..10).tap { |x| puts "original: #{x}" }
  .to_a.tap { |x| puts "array: #{x}" }

puts "\n\n"

"my string".then { |s| s.upcase } #=> "MY STRING"
3.next.then { |x| x ** x }.to_s  #=> "256"
