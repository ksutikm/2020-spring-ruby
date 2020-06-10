# frozen_string_literal: true

# The list of possible book genre types
module BookGenreType
  MILITARY_AFFAIRS = 'Военное дело'
  BUSINESS_LITERATURE = 'Деловая литература'
  DETECTIVES = 'Детективы'
  CHILDREN_LITERATURE = 'Детская литература'
  NONFICTION_LITERATURE = 'Документальная литература'
  HOME_AND_FAMILY = 'Дом и семья'
  GENRE_NOT_DEFINED = 'Жанр не определен'
  CLASSIC = 'Классика'
  COMPUTERS_AND_INTERNET = 'Компьютеры и интернет'
  ROMANCE_NOVEL = 'Любовные романы'
  SCIENCE = 'Наука'
  SCIENTIFIC_AND_EDUCATIONAL = 'Научно-образовательная литература'
  EDUCATION = 'Образование'
  POETRY_AND_DRAMA = 'Поэзия и Драматургия'
  ADVENTURES = 'Приключения'
  PROSE = 'Проза'
  RELIGION_AND_SPIRITUALITY = 'Религия и духовность'
  REFERENCE_LITERATURE = 'Справочная литература'
  ANCIENT_LITERATURE = 'Старинная литература'
  TECHNIC = 'Техника'
  THRILLERS = 'Триллеры'
  FICTION = 'Фантастика'
  FANTASY = 'Фентази'
  FOLKLORE = 'Фольклор'
  HUMOROUS_LITERATURE = 'Юмористическая литература'

  def self.all_types
    [
      MILITARY_AFFAIRS, BUSINESS_LITERATURE, DETECTIVES, CHILDREN_LITERATURE,
      NONFICTION_LITERATURE, HOME_AND_FAMILY, GENRE_NOT_DEFINED, CLASSIC,
      COMPUTERS_AND_INTERNET, ROMANCE_NOVEL, SCIENCE, SCIENTIFIC_AND_EDUCATIONAL,
      EDUCATION, POETRY_AND_DRAMA, ADVENTURES, PROSE, RELIGION_AND_SPIRITUALITY,
      REFERENCE_LITERATURE, ANCIENT_LITERATURE, TECHNIC, THRILLERS,
      FICTION, FANTASY, FOLKLORE, HUMOROUS_LITERATURE
    ]
  end
end
