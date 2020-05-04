require 'erb'

def greeting(name, surname)
    puts ERB.new("Привет, <%= name %> <%= surname %>!\n\n").result(binding)
end

def event(name_event, name, text, host_name)
    template = "
    Дорогой <%= name %>, ты приглашен на '<%= name_event %>'
    <%= text %>
    Твой друг, <%= host_name %>\n\n"
    puts ERB.new(template).result(binding)
end

def only_shop(prodact_name, cost, category)
    templace = 
    "<% if category == :dress %>
    Купите замечательное платье!
    <% elsif category == :shoes %>
    Купите замечательную обувь!
    <% elsif category == :tools %>
    Купите замечательные инструменты!
    <% end %>
    Название: <%= prodact_name %>\n
    Цена: <%= cost %>\n\n"
    puts ERB.new(templace).result(binding)
end

def time_table
    schedule = [
        {name: "Теормех", audience: 112, when: :numerator},
        {name: "Мат. ан.", audience: 205},
        {name: "Теор. игр", audience: 108},
        {name: "Ин. яз.", audience: 507, when: :denomitanor},
    ]
    schedule
end

def get_timetable(table, weak)
    message = "Schedule for the week:
    <% table.each do |subject| %>
    <% if subject[:when] == nil || subject[:when] == weak %> <%=subject[:name]%> <%= subject[:audience]%> <% end %> <% end %>"
    puts ERB.new(message).result(binding)
end


greeting("CHUVASHKA", " DUDE")
event("Бредовуха", "HOKAN",
    "Сбор в 19:00 жду тебя в дискорде, не опаздывай! :D", "CHUVASHKA")
only_shop("Mango", 1500, :shoes)
get_timetable(time_table, :numerator)