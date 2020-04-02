def h(a)
  return a.to_i
end

def help()
  puts "Приложение эмитирует игру на рынке. Передайте стартовый капитал и количество дней в качестве аргументов приложения.

    game_on_market.rb CAPITAL DAYS
    "
end

def main
  i = 0
  a = h(ARGV[1])
  b = h(ARGV[0])
  while i < a
    c = rand(15)
    case c
    when 15...16
      b *= 1.1
    when 13..14
      b *= 1.02
    when 10..12
      b = b
    when 8..9
      b -= b * 0.02
    when 6..7
      b -= b * 0.1
    else
      b -= b * 0.5
    end
    puts "Текущее состояние счета: #{b}"
    i += 1
  end
end

if __FILE__ == $0
  if ARGV.length == 0
    help
  else
    main
  end
end
