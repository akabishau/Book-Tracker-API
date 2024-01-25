class UserBookService
  def self.add_book_to_user(user, book_params, status)
    new_book = BookService.find_or_create_book(book_params)
    user_book = user.user_books.find_or_initialize_by(book: new_book)
    user_book.status = status
    user_book.save
    user_book
  end

  # TODO: add reading status
  def self.get_user_books(user)
    user.books
  end
end
