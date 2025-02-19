class BorrowersController < ApplicationController
  def index
    @borrowers = Borrower.all
  end

  def show
    @borrower = Borrower.find(params[:id])
  end

  def new
    @borrower = Borrower.new
  end

  def create
    @borrower = Borrower.new(borrower_params)
    if @borrower.save
      redirect_to @borrower, notice: 'Borrower added successfully.'
    else
      render :new
    end
  end

  private

  def borrower_params
    params.require(:borrower).permit(:name)
  end
end
