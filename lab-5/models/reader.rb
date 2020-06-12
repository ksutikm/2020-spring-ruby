# frozen_string_literal: true

# The information about the reader
Reader = Struct.new(:id, :last_name, :name, :middle_name, :date_of_birth,
                    :list_of_book_on_hands, :age, keyword_init: true)
