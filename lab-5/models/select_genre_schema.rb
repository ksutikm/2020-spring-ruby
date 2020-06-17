# frozen_string_literal: true

require 'dry-schema'

require_relative 'schema_types'

SelectGenreFormSchema = Dry::Schema.Params do
  required(:genre).maybe(SchemaTypes::StrippedString)
end
