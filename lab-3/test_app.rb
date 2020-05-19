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

  opts[:books] = BookList.new([
    Book.new('Толстой', 'Преступление и наказание', '2020-06-17'),
    Book.new('Данте', 'Божественная комедия', '2020-05-18'),
    Book.new('Ницше', 'Заратустра', '2020-04-20'),
    Book.new('Толстой', 'Пр', '2018-06-17'),
    Book.new('Данте', 'Боже', '2017-05-18'),
    Book.new('Ницше', 'Зара', '2015-04-20'),
    Book.new('Толстой', 'Преступление и наказание', '2020-06-17'),
    Book.new('Данте', 'Божественная комедия', '2020-05-18'),
    Book.new('Ницше', 'Заратустра', '2020-04-20'),
  ])

  route do |r|
    r.public if opts[:serve_static]

    r.root do
      'Hello, world!'
    end

    r.on 'book' do
      r.is do
        view('book')
      end

      r.on 'statistic' do
        @stats_years = opts[:books].years


        view('statistic')
      end

      r.on 'books' do
        r.is do
          @sorted_books = opts[:books].sorted
          view('books')
        end

        r.on 'new' do
          r.get do
            view('new_test')
          end

          r.post do
            @params = InputValidators.check_book(r.params['author'], r.params['name'], r.params['date'])
            if @params[:errors].empty?
              opts[:books].add_book(Book.new(@params[:author], @params[:name], @params[:date]))
              r.redirect '/book/books'
            else
              view('new_test')
            end
          end
        end
      end
    end

  end
end
