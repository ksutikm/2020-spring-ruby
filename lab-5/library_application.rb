# frozen_string_literal: true

require 'date'
require 'forme'
require 'roda'

require_relative 'models'

# The application class
class LibraryApplication < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :forme
  plugin :hash_routes
  plugin :path
  plugin :render
  plugin :status_handler
  plugin :view_options

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  opts[:store] = Store.new
  opts[:books] = opts[:store].book_list
  opts[:readers] = opts[:store].reader_list

  status_handler(404) do
    view('not_found')
  end

  require_relative 'routes/branch_books.rb'
  require_relative 'routes/branch_delete_book.rb'
  require_relative 'routes/branch_delete_reader.rb'
  require_relative 'routes/branch_readers.rb'
  require_relative 'routes/library.rb'
  require_relative 'routes/library_add.rb'
  require_relative 'routes/library_give_book.rb'
  require_relative 'routes/select_book.rb'

  route do |r|
    r.public if opts[:serve_static]
    r.hash_routes

    r.root do
      r.redirect library_path
    end
  end
end
