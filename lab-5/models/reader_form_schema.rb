# frozen_string_literal: true

require 'dry-schema'

require_relative 'schema_types'

ReaderFormSchema = Dry::Schema.Params do
  required(:last_name).filled(SchemaTypes::StrippedString)
  required(:name).filled(SchemaTypes::StrippedString)
  required(:middle_name).filled(SchemaTypes::StrippedString)
  required(:date_of_birth).filled(:date)
end
