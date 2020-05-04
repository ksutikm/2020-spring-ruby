# frozen_string_literal: true

require 'csv'
require_relative 'organization'
require_relative 'organization_list'

# Module reads CSV data into files
module DataReader
  DATA_FILE = File.expand_path('../data/test_result.csv', __dir__)

    def self.data_reader
        org_list = Organization.new
        CSV.foreach(STOPS_FILE, encoding: 'utf-8') do |row|
            org_list.add(Organization.new(row[0], row[1], row[2]))
        end
        org_list
    end

end

