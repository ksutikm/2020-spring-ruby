# frozen_string_literal: true

# Validators for the incoming requests
module InputValidators
  def self.check_date_format(date)
    if /\d{4}-\d{2}-\d{2}/ =~ date
      []
    else
      ['Дата должна быть передана в формате ГГГГ-ММ-ДД']
    end
  end

  def self.check_book(raw_author, raw_name, raw_date)
    author = raw_author || ''
    name = raw_name || ''
    date = raw_date || ''
    errors = [].concat(check_author(author))
               .concat(check_name(name))
               .concat(check_date(date))
               .concat(check_date_format(date))
               .concat(check_date_correct(date))
    {
      author: author,
      name: name,
      date: date,
      errors: errors
    }
  end

  def self.check_date_correct(raw_date)
    if !raw_date.empty?
      date = raw_date.split('-')
      if date[1].to_i < 1 || date[1].to_i > 12
        ['Такого месяца не существует']
      elsif date[2].to_i < 1 || date[2].to_i > 31
        ['Такого дня не существует']
      else
        []
      end
    else
      []
    end
  end

  def self.check_author(author)
    if author.empty?
      ['Имя автора не может быть пустым']
    else
      []
    end
  end

  def self.check_name(name)
    if name.empty?
      ['Название книги не может быть пустым']
    else
      []
    end
  end

  def self.check_date(date)
    if date.empty?
      ['Дата не может быть пустой']
    else
      []
    end
  end
end
