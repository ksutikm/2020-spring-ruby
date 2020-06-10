# frozen_string_literal: true

# The information about the good books
Book = Struct.new(:id, :author, :title, :inverted_number, :genre,
                  :age_rating, :number_in_library, :number_on_hands, keyword_init: true)
