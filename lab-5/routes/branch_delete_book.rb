# frozen_string_literal: true

# Class
class LibraryApplication
  hash_branch('delete_book') do |r|
    r.is do
      @books = opts[:books].all_books
      view('books')
    end
  end
end