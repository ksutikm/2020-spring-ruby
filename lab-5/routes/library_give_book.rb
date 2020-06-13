# frozen_string_literal: true

# Class
class LibraryApplication
  hash_branch('give') do |r|
    r.is do
      @readers = opts[:readers].all_readers
      view('readers')
    end
  end
end
