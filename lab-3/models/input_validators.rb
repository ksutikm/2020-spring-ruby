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

  def self.check_book(raw_author, raw_name, raw_date, raw_estimation, raw_format, raw_size, raw_comment)
    author = raw_author || ''
    name = raw_name || ''
    date = raw_date || ''
    format = raw_format || ''
    size = raw_size || ''
    estimation = raw_estimation || ''
    comment = raw_comment || ''
    errors = [].concat(check_author(author))
               .concat(check_name(name))
               .concat(check_date(date))
               .concat(check_date_format(date))
               .concat(check_date_correct(date))
               .concat(check_format_new_book(format))
               .concat(check_size(size, format))
               .concat(check_estimation(estimation))
               .concat(check_comment(comment))
    {
      author: author,
      name: name,
      date: date,
      format: format,
      size: size,
      estimation: estimation,
      comment: comment,
      errors: errors
    }
  end

  def self.check_comment(comment)
    if comment.size > 2000
      ['Комментарий вышел за предел 2000 символов']
    else
      []
    end
  end

  def self.check_estimation(est)
    if est.empty?
      ['Оценка не может быть пустой']
    elsif est.to_i < 0 || est.to_i > 10
      ['Оценка должна быть в диапозоне от 0 до 10']
    else
      []
    end
  end

  def self.check_size(size, format)
    if format.empty?
      ['Не задать размер произведения по неправильному формату чтения']
    else
      if size.empty?
        ['Размер произведения не может быть пустым']
      elsif format == 'бумажная книга' || format== 'электронная книга'
        if size.to_i <= 0
          ['Введен не допустимый размер произведения']
        else
          []
        end
      elsif format == 'аудиокнига'
        if /\d{1}:\d{2}:\d{2}/ =~ size
          s = size.split(':')
          if s[0].to_i <= 0
            ['Введено неверное количество часов']
          elsif s[1].to_i < 0 || s[1].to_i > 60
            ['Введено неверное количество минут']
          elsif s[2].to_i < 0 || s[2].to_i > 60
            ['Введено неверное количество секунд']
          else
            []
          end
        else
          ['Размер должен быть в формате h:mm:ss']
        end
      else
        []
      end
    end
  end

  def self.check_format_new_book(form)
    if form.empty?
      ['Формат произведения не может быть пустым']
    elsif form == 'бумажная книга'
      []
    elsif form == 'электронная книга'
      []
    elsif form == 'аудиокнига'
      []
    else
      ['Введен неверный формат чтения']
    end
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

  def self.check_format(raw_format)
    format = raw_format || ''
    {
      format: format,
    }
  end
end
