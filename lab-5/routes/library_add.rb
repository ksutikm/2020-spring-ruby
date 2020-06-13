# frozen_string_literal: true

# Class
class LibraryApplication
  hash_path('/library/add') do |r|
    r.is do
      @books = opts[:books].all_books
      @readers = opts[:readers].all_readers
      view('library_add')
    end
  end
end
