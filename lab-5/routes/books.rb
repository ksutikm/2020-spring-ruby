# frozen_string_literal: true

# Class
class BookApplication
  # path :books, '/cool_books'
  # path :book_new, '/cool_books/new'
  # path Book do |book, action|
  #   if action
  #     "/cool_books/#{book.id}/#{action}"
  #   else
  #     "/cool_books/#{book.id}"
  #   end
  # end

  hash_branch('books') do |r|
    # append_view_subdir('books')
    # set_layout_options(template: '../views/layout')

    r.is do
      # @books = opts[:books].all_books
      view('books')
    end

    
  end
end
