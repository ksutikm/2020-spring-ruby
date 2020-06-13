# frozen_string_literal: true

require 'dry-schema'

require_relative 'schema_types'

GiveBookSchema = Dry::Schema.Params do
  required(:is_book_new).filled(SchemaTypes::StrippedString)
  required(:date_to_given_book).filled(:date)
end
