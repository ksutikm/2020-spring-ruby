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
      @reader_list_books_ = BookReturnList.new
      @reader_list_books_.upgrade_book_list(@reader.list_of_book_on_hands, opts[:books])
      @reader_list_books = @reader_list_books_.all_books_return
      next if @reader.nil?

      r.is do
        @full_books = opts[:books]
        view('give_readers')
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

      r.on 'delete' do
        r.get do
          @parameters = {}
          view('reader_delete')
        end

        r.post do
          @parameters = DryResultFormeWrapper.new(BookDeleteSchema.call(r.params))
          if @parameters.success?
            opts[:books] = opts[:readers].delete_reader(@reader.id, opts[:books])
            r.redirect(choice_path('readers'))
          else
            view('reader_delete')
          end
        end
      end

      r.on 'select_book' do
        @parameters = DryResultFormeWrapper.new(SelectBookFormSchema.call(r.params))
        @filtered_books = if @parameters.success?
                            GiveBookList.filter(@parameters, opts[:books].all_books, @reader.age)
                          else
                            opts[:books].all_books
                          end
        @count = GiveBookList.change_age(opts[:books].all_books, @reader.age)
        r.get do
          @parameters = {}
          view('select_book')
        end

        r.post do
          view('select_book')
        end
      end

      r.on 'return_book' do
        r.on Integer do |book_id|
          @book_return = @reader_list_books_.book_return_by_id(book_id)

          r.get do
            view('return_books')
          end

          r.post do
            @penalty = Calculation.calculate_penalty(@book_return.date)
            @reader.list_of_book_on_hands = Calculation.delete_book_in_reader(
              @reader.list_of_book_on_hands, @book_return.date, @book_return.book.id
            )
            opts[:books].change_count_books(@book_return.book.id)
            @book_return = nil
            @result_penalty = Calculation.calculate_penalty_result(@penalty)
            view('return_books')
          end
        end
      end
    end
  end
end
