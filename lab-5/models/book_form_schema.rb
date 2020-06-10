# frozen_string_literal: true

require 'dry-schema'

require_relative 'schema_types'

BookFormSchema = Dry::Schema.Params do
  required(:title).filled(SchemaTypes::StrippedString)
  required(:author).filled(SchemaTypes::StrippedString)
  required(:inverted_number).filled(:integer, gt?: 0)
  required(:genre).filled(SchemaTypes::StrippedString)
  required(:age_rating).filled(:string)
  required(:number_in_library).filled(:integer, gt?: 0)
  required(:number_on_hands).filled(:integer)
end
