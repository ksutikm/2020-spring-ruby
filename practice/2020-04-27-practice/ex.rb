require 'erb'

weekday = Time.now.strftime('%A')
simple_template = "Today is <%= weekday %>."

renderer = ERB.new(simple_template)
puts renderer.result()

puts "\n\n"

def make_world_happy(name)
    template = 'Будь счастлив, мой друг <%= name %>!' # Описываем шаблон
    renderer = ERB.new(template) # Создаём шаблонизатор
    context = binding # Захватываем контекст выполнения
    puts renderer.result(context) # Формируем строку и печатаем её
  end
  
  make_world_happy('CHUVASHKA')