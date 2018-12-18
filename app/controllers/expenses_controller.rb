class ExpensesController < ApplicationController
  before_action :find_family, only: [:index, :show, :edit]
  layout 'devise', only: [:show]

  def index
    @expenses = @family.expenses.order(date: :desc).distinct
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @category = Category.find(params[:expense][:category]) unless params[:expense][:category].empty?
    @expense.category = @category
    if @expense.update(expense_params)
      redirect_to families_path
    else
      render :edit
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :description, :date, :percentage, :receipt, :amount)
  end

  def find_family
    @family = Family.find(params[:family_id])
  end
end
