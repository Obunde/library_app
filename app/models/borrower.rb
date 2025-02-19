class Borrower < ApplicationRecord
    has_many :borrowing_records, dependent: :destroy
    has_many :books, through: :borrowing_records
  
    validates :name, presence: true
  end
  