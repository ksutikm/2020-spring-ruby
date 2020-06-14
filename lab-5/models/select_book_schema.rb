# frozen_string_literal: true

require 'dry-schema'

require_relative 'schema_types'

SelectBookFormSchema = Dry::Schema.Params do
  required(:author).maybe(SchemaTypes::StrippedString)
  required(:genre).maybe(SchemaTypes::StrippedString)
end
