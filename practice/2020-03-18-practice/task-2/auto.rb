class Auto
  attr_reader :brand, :model, :manifacture_year, :gasoline_consumption

  def initialize(brand, model, manifacture_year, gasoline_consumption)
    @brand = brand
    @model = model
    @manifacture_year = manifacture_year
    @gasoline_consumption = gasoline_consumption
  end

  def to_s
    "Марка: #{@brand}\nМодель: #{@model}\nГод выпуска: #{@manifacture_year}\nСредний расход автомобиля: #{@gasoline_consumption}\n\n"
  end
end
