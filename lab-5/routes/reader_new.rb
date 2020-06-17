# frozen_string_literal: true

# Class
class LibraryApplication
  hash_path('/readers/new') do |r|
    r.get do
      @parameters = {}
      view('reader_new')
    end

    r.post do
      @parameters = DryResultFormeWrapper.new(ReaderFormSchema.call(r.params))
      if @parameters.success?
        reader = opts[:readers].add_reader(@parameters)
        r.redirect(path(reader))
      else
        view('reader_new')
      end
    end
  end
end
