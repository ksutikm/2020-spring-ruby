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

#   opts[:store] = Store.new
  opts[:books] = BookList.new([
    Book.new(
      id: 1,
      author: 'Фромм Э.',
      title: 'Искусство любить',
      inverted_number: 5,
      genre: 'Книга по философии',
      age_rating: '18',
      number_in_library: 5,
      number_on_hands: 2
    )
  ])
  # opts[:books] = BookList.new

  status_handler(404) do
    view('not_found')
  end

  require_relative 'routes/library.rb'

  route do |r|
    r.public if opts[:serve_static]
    r.hash_branches

    r.root do
      r.redirect library_path
    end
  end
end
