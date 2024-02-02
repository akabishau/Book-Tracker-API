class Api::V1::BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_books = UserBookService.get_user_books(current_user)
    render json: @user_books, status: :ok
  end

  # post /books
  def create
    user_book = UserBookService.add_book_to_user(current_user, book_params, params[:status])

    if user_book.persisted?
      render json: user_book, status: :created
    else
      render json: user_book.errors, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :google_id, authors: [])
  end
end
