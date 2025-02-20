require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @book = Book.create(title: "Test Book", author: "Test Author", isbn: "12345")
  end

  test "should get index" do
    get books_path
    assert_response :success
  end

  test "should get show" do
    get book_path(@book)
    assert_response :success
  end

  test "should get new" do
    get new_book_path
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count", 1) do
      post books_path, params: { book: { title: "New Book", author: "New Author", isbn: "67890" } }
    end
    assert_redirected_to book_path(Book.last)
    follow_redirect!
    assert_match "Book was successfully created.", response.body
  end

  test "should get edit" do
    get edit_book_path(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_path(@book), params: { book: { title: "Updated Title" } }
    assert_redirected_to book_path(@book)
    @book.reload
    assert_equal "Updated Title", @book.title
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_path(@book)
    end
    assert_redirected_to books_path
    follow_redirect!
    assert_match "Book was successfully deleted.", response.body
  end

  test "should borrow book" do
    borrower = Borrower.create(name: "John Doe")
    post borrow_book_path(@book), params: { borrower_name: borrower.name }
    assert_redirected_to book_path(@book)
    @book.reload
    assert_not @book.is_available
  end

  test "should return book" do
    borrower = Borrower.create(name: "John Doe")
    @book.borrow(borrower)
    post return_book_path(@book)
    assert_redirected_to book_path(@book)
    @book.reload
    assert @book.is_available
  end
end
