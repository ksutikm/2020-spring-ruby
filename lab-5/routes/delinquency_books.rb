# frozen_string_literal: true

# Class
class LibraryApplication
  hash_branch('delinquency_books') do |r|
    r.get do
      @parameters = {}
      @books = []
      view('delinquency_books')
    end

    r.post do
      @parameters = DryResultFormeWrapper.new(DelinquencyBooksFormSchema.call(r.params))
      if @parameters.success?
        books = Calculation.delinquency_books(opts[:readers].all_readers, @parameters[:date])
        @books = Calculation.books_for_id(books, opts[:books])
      else
        @books = []
      end
      view('delinquency_books')
    end
  end
end
