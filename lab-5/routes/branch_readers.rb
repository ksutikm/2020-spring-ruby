# frozen_string_literal: true

# Class
class LibraryApplication
  hash_branch('readers') do |r|
    r.is do
      @readers = opts[:readers].all_readers
      view('readers')
    end

    r.on Integer do |reader_id|
      @reader = opts[:readers].reader_by_id(reader_id)
      @reader_list_books = GiveBookList.reader_book_list(opts[:books],
                                                         @reader.list_of_book_on_hands)
      pp @reader_list_books
      next if @reader.nil?

      r.is do
        @full_books = opts[:books]
        view('reader')
      end

      r.on 'give_book' do
        @give_books = GiveBookList.book_list_for_given(opts[:books].all_books)
        r.get do
          @parameters = {}
          view('give_book_form')
        end

        r.post do
          @parameters = DryResultFormeWrapper.new(GiveBookSchema.call(r.params))
          if @parameters.success?
            find_book_id = GiveBookList.find_book(@parameters[:is_book_new], opts[:books].all_books)
            book = opts[:books].book_by_id(find_book_id[0])
            @params = InputValidators.check_given_book(book, @reader)
            if @params[:errors].empty?
              list = GiveBookList.add_book_in_list(@reader, find_book_id[0],
                                                   @parameters[:date_to_given_book])
              @reader.list_of_book_on_hands = list
              opts[:books].change_book(find_book_id[0])
              r.redirect path(@reader)
            else
              view('give_book_form')
            end
          else
            view('give_book_form')
          end
        end
      end

      # r.on 'delete' do
      #   r.get do
      #     @parameters = {}
      #     view('book_delete')
      #   end

      #   r.post do
      #     @parameters = DryResultFormeWrapper.new(BookDeleteSchema.call(r.params))
      #     if @parameters.success?
      #       opts[:books].delete_book(@book.id)
      #       r.redirect(choice_path('books'))
      #     else
      #       view('book_delete')
      #     end
      #   end
      # end
    end

    r.on 'new' do
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
end
