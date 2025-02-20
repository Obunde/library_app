class Book < ApplicationRecord
    has_many :borrowing_records, dependent: :destroy
    has_many :borrowers, through: :borrowing_records
  
    validates :title, :author, :isbn, presence: true
  
    before_create :set_default_availability
  
    def borrow(borrower)
      return false unless is_available
  
      ActiveRecord::Base.transaction do
        update!(is_available: false)
        BorrowingRecord.create!(book: self, borrower: borrower, borrowed_at: Time.current)
      end
    rescue ActiveRecord::RecordInvalid
      false
    end
  
    def return_book
      last_record = borrowing_records.where(returned_at: nil).last
      return false unless last_record
  
      ActiveRecord::Base.transaction do
        last_record.update!(returned_at: Time.current)
        update!(is_available: true)
      end
    rescue ActiveRecord::RecordInvalid
      false
    end
  
    private
  
    def set_default_availability
      self.is_available = true if is_available.nil?
    end
  end
  