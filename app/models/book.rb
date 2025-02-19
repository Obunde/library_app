class Book < ApplicationRecord
    has_many :borrowing_records, dependent: :destroy
    has_many :borrowers, through: :borrowing_records
  
    validates :title, :author, :isbn, presence: true
  
    def borrow(borrower)
      return false unless is_available
  
      self.update(is_available: false)
      BorrowingRecord.create(book: self, borrower: borrower, borrowed_at: Time.current)
    end
  
    def return_book
      last_record = borrowing_records.where(returned_at: nil).last
      return false unless last_record
  
      last_record.update(returned_at: Time.current)
      self.update(is_available: true)
    end
  end
  