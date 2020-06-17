# frozen_string_literal: true

# Class
class LibraryApplication
  hash_branch('select_genre') do |r|
    @parameters = DryResultFormeWrapper.new(SelectGenreFormSchema.call(r.params))
    pp @parameters
    @select_books = if @parameters.success?
                      Calculation.list_genre(opts[:books].all_books, @parameters[:genre])
                    else
                      opts[:books].all_books
                    end

    r.get do
      @parameters = {}
      view('select_genre')
    end

    r.post do
      view('select_genre')
    end
  end
end