# frozen_string_literal: true

require 'dry-schema'

require_relative 'schema_types'

DelinquencyBooksFormSchema = Dry::Schema.Params do
  required(:date).filled(:date)
end
