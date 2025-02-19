class CreateBorrowingRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :borrowing_records do |t|
      t.references :book, null: false, foreign_key: true
      t.references :borrower, null: false, foreign_key: true
      t.datetime :borrowed_at
      t.datetime :returned_at

      t.timestamps
    end
  end
end
