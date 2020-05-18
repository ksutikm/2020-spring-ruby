# frozen_string_literal: true

require 'roda'
require_relative 'models'

# The core class of the web application for managing tests
class TestApp < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :render

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  route do |r|
    r.public if opts[:serve_static]

    @tests = TestList.new([
                            Test.new('Lab №1', '2020-04-05', 'Ruby'),
                            Test.new('Lab №2', '2020-04-20', 'bla bla Ruby'),
                            Test.new('examen', '2020-06-20', 'ggwp')
                          ])

    r.root do
      'Hello, world!'
    end

    r.on 'tests' do
      @params = InputValidators.check_date_description(r.params['date'], r.params['description'])

      @filtered_tests = if @params[:errors].empty?
                          @tests.filter(@params[:date], @params[:description])
                        else
                          @tests.all_tests
                          end

      view('tests')
    end
  end
end
