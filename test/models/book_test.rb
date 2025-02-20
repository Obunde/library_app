require "test_helper"

class BookTest < ActiveSupport::TestCase
  def setup
    @book = Book.new(title: "Test Book", author: "Test Author", isbn: "12345")
  end

  test "should be valid with valid attributes" do
    assert @book.valid?
  end

  test "should not be valid without a title" do
    @book.title = nil
    assert_not @book.valid?
  end

  test "should mark book as unavailable when borrowed" do
    borrower = Borrower.create(name: "John Doe")
    @book.borrow(borrower)
    assert_not @book.is_available
  end
end
