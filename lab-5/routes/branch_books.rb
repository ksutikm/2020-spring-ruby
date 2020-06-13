# frozen_string_literal: true

# Class
class LibraryApplication
  hash_branch('books') do |r|
    r.is do
      @books = opts[:books].all_books
      view('books')
    end

    r.on Integer do |book_id|
      @book = opts[:books].book_by_id(book_id)
      next if @book.nil?

      r.is do
        view('book')
      end

      r.on 'edit' do
        r.get do
          @parameters = @book.to_h
          view('book_edit')
        end

        r.post do
          @parameters = DryResultFormeWrapper.new(BookFormSchema.call(r.params))
          if @parameters.success?
            opts[:books].update_book(@book.id, @parameters)
            r.redirect(path(@book))
          else
            view('book_edit')
          end
        end
      end

      r.on 'delete' do
        r.get do
          @parameters = {}
          view('book_delete')
        end

        r.post do
          @parameters = DryResultFormeWrapper.new(BookDeleteSchema.call(r.params))
          if @parameters.success?
            opts[:readers] = opts[:books].delete_book(@book.id, opts[:readers])
            r.redirect(choice_path('books'))
          else
            view('book_delete')
          end
        end
      end
    end

    r.on 'new' do
      r.get do
        @parameters = {}
        view('book_new')
      end

      r.post do
        @parameters = DryResultFormeWrapper.new(BookFormSchema.call(r.params))
        if @parameters.success?
          book = opts[:books].add_book(@parameters)
          r.redirect(path(book))
        else
          view('book_new')
        end
      end
    end
  end
end
