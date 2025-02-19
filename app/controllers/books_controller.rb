class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :borrow, :return]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully deleted.'
  end

  def borrow
    borrower_name = params[:borrower_name]
    borrower = Borrower.find_or_create_by(name: borrower_name)

    if @book.borrow(borrower)
      redirect_to @book, notice: "Book borrowed by #{borrower.name}."
    else
      redirect_to @book, alert: "Book is not available."
    end
  end

  def return
    if @book.return_book
      redirect_to @book, notice: "Book returned successfully."
    else
      redirect_to @book, alert: "Error returning book."
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :is_available)
  end
end
