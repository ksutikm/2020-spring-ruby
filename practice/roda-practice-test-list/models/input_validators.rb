# frozen_string_literal: true

# Validators for the incoming requests
module InputValidators
  def self.check_date_description(raw_date, raw_description)
    date = raw_date || ''
    description = raw_description || ''
    errors = []
    errors.concat(check_date_format(date)) unless date.empty?
    {
      date: date,
      description: description,
      errors: errors
    }
  end

  def self.check_date_format(date)
    if /\d{4}-\d{2}-\d{2}/ =~ date
      []
    else
      ["\xD0\x94\xD0\xB0\xD1\x82\xD0\xB0 \xD0\xB4\xD0\xBE\xD0\xBB\xD0\xB6\xD0\xBD\xD0\xB0 \xD0\xB1\xD1\x8B\xD1\x82\xD1\x8C \xD0\xBF\xD0\xB5\xD1\x80\xD0\xB5\xD0\xB4\xD0\xB0\xD0\xBD\xD0\xB0 \xD0\xB2 \xD1\x84\xD0\xBE\xD1\x80\xD0\xBC\xD0\xB0\xD1\x82\xD0\xB5 \xD0\x93\xD0\x93\xD0\x93\xD0\x93-\xD0\x9C\xD0\x9C-\xD0\x94\xD0\x94"]
    end
  end
end
