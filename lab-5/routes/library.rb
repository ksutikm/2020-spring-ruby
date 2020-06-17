# frozen_string_literal: true

# Class
class LibraryApplication
  path :library, '/library'
  path :book_new, '/books/new'
  path :choice do |choice|
    "/#{choice}"
  end
  path Book do |book, action|
    if action
      "/books/#{book.id}/#{action}"
    else
      "/books/#{book.id}"
    end
  end
  path :library_new, '/library/add'
  path :reader_new, '/readers/new'
  path Reader do |reader, action, book|
    if book
      "/readers/#{reader.id}/#{action}/#{book.id}"
    elsif action
      "/readers/#{reader.id}/#{action}"
    else
      "/readers/#{reader.id}"
    end
  end
  path :library_give, '/give'
  path :delete do |delete|
    "/delete_#{delete}"
  end
  path :select_book, '/select_book'
  path :return_book, '/return_book'
  path :select_genre, '/select_genre'

  hash_path('/library') do |r|
    # append_view_subdir('books')
    # set_layout_options(template: '../views/layout')

    r.is do
      view('library')
    end
  end
end
