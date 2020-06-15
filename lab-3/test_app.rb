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
    Book.new('Достоевский', 'Идиот', '2020-06-17', '9', 'бумажный формат', '300', ''),
    Book.new('Данте', 'Божественная комедия', '2020-05-18', '10', 'электронная книга', '300', ''),
    Book.new('Ницше', 'Заратустра', '2020-04-20', '9', 'аудиокнига', '300', ''),
    Book.new('Достоевский', 'Идиот', '2018-06-17', '9', 'аудиокнига', '300', ''),
    Book.new('Данте', 'Божественная комедия', '2017-05-18', '9', 'бумажный формат', '300', ''),
    Book.new('Ницше', 'Заратустра', '2015-04-20', '10', 'электронная книга', '300', ''),
    Book.new('Достоевский', 'Идиот', '2020-06-17', '10', 'электронная книга', '300', ''),
    Book.new('Данте', 'Божественная комедия', '2020-05-18', '9', 'аудиокнига', '300', ''),
    Book.new('Ницше', 'Заратустра', '2020-04-20', '9', 'бумажный формат', '300', ''),
  ])

  route do |r|
    r.public if opts[:serve_static]

    r.root do
      r.redirect "/book"
    end

    r.on 'book' do
      r.is do
        view('book')
      end

      r.on 'statistic' do
        @stats_years = opts[:books].years
        r.is do
          
          view('statistic')
        end
        

        
        r.on 'stats' do

          r.get do
            view('stats')
          end

          r.post do
            pp r.params['year']
            # pp @month = @stats_years[r.params['year']]
            view('stats')
          end
        end
      end

      r.on 'like' do
        r.is do
          @likes_bools = opts[:books].likes

          view('like')
        end
      end

      r.on 'books' do
        r.is do
          # @sorted_books = opts[:books].sorted

          @params = InputValidators.check_format(r.params['format'])
          pp @params[:format]
          @filtered_books = if @params[:format].empty?
                              opts[:books].sorted
                            else
                              opts[:books].filter(@params[:format])
                            end

          view('books')
        end

        r.on 'new' do
          r.get do
            view('new_test')
          end

          r.post do
            @params = InputValidators.check_book(r.params['author'], r.params['name'], r.params['date'],
                                                 r.params['estimation'], r.params['format'], r.params['size'],
                                                 r.params['comment'])
            pp @params[:errors]
            if @params[:errors].empty?
              opts[:books].add_book(Book.new(@params[:author], @params[:name], @params[:date], @params[:estimation], @params[:format], @params[:size], @params[:comment]))
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
