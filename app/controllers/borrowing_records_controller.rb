class BorrowingRecordsController < ApplicationController
  def index
    @borrowing_records = BorrowingRecord.all
  end

  def show
    @borrowing_record = BorrowingRecord.find(params[:id])
  end
end
