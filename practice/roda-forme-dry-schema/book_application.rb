# frozen_string_literal: true

require 'date'
require 'forme'
require 'roda'

require_relative 'models'

# The application class
class BookApplication < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :forme
  plugin :render
  plugin :status_handler

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  opts[:books] = BookList.new(
    [
      Book.new(
        id: 21,
        title: 'Идиот',
        author: 'Лев Толстой',
        published_on: Date.parse('2013-06-18')
      ),
      Book.new(
        id: 7,
        title: 'Божественная комедия',
        author: 'Данте Алигьери',
        published_on: Date.parse('2000-05-20')
      ),
      Book.new(
        id: 2,
        title: 'Заратустра',
        author: 'Фридрих Ницше',
        published_on: Date.parse('1935-07-08')
      )
    ]
  )

  status_handler(404) do
    view('not_found')
  end

  route do |r|
    r.public if opts[:serve_static]

    r.root do
      r.redirect '/books'
    end

    r.on 'books' do
      r.is do
        @books = opts[:books].all_books
        view('books')
      end

      r.on Integer do |book_id|
        @book = opts[:books].book_by_id(book_id)
        next if @book.nil?

        r.is do
          view('book')
        end

        r.on 'edit' do
          r.get do
            @parameters = @book.to_h
            view('book_edit')
          end

          r.post do
            @parameters = DryResultFormeWrapper.new(BookFormSchema.call(r.params))
            if @parameters.success?
              opts[:books].update_book(@book.id, @parameters)
              r.redirect "/books/#{@book.id}"
            else
              view('book_edit')
            end
          end
        end

        r.on 'delete' do
          r.get do
            @parameters = {}
            view('book_delete')
          end

          r.post do
            @parameters = DryResultFormeWrapper.new(BookDeleteSchema.call(r.params))
            if @parameters.success?
              opts[:books].delete_book(@book.id)
              r.redirect '/books'
            else
              view('book_delete')
            end
          end
        end
      end

      r.on 'new' do
        r.get do
          @parameters = {}
          view('book_new')
        end

        r.post do
          @parameters = DryResultFormeWrapper.new(BookFormSchema.call(r.params))
          if @parameters.success?
            opts[:books].add_book(@parameters)
            r.redirect '/books'
          else
            view('book_new')
          end
        end
      end
    end
  end
end
