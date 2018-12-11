class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @user = current_user

    @child = Child.find(params)
    @expense.user_id = @user
    @expense.chil_id = @child
    if @expense.save
      redirects family_expenses_path
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :description, :date, :percentage,  :receipt, :amount, :category)
  end
end
