class BorrowingRecord < ApplicationRecord
  belongs_to :book
  belongs_to :borrower

  validates :borrowed_at, presence: true
end
