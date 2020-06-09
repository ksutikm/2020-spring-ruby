# frozen_string_literal: true

# Class
class LibraryApplication
  path :library, '/library'
  path :choice do |choice|
    "/library/#{choice}"
  end

  hash_branch('library') do |r|
    # append_view_subdir('books')
    # set_layout_options(template: '../views/layout')

    r.is do
      # @books = opts[:books].all_books
      view('library')
    end

    r.on 'books' do
      view('books')
    end

    r.on 'readers' do
      view('readers')
    end
  end
end
