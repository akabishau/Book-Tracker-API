class BookService
  def self.find_or_create_book(book_params)
    Book.find_or_create_by(google_id: book_params[:google_id]) do |book|
      book.title = book_params[:title]
      book.authors = book_params[:authors]
    end
  end
end
