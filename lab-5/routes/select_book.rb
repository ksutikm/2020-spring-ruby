# frozen_string_literal: true

# Class
class LibraryApplication
  hash_branch('select_book') do |r|
    @readers = opts[:readers].all_readers
    r.is do
      view('readers')
    end
  end
end
