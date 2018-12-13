class ExpensesController < ApplicationController
  before_action :find_family, only: [:index]

  def index
    @expenses = @family.expenses
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
    @category = Category.find(params[:expense][:category])  unless params[:expense][:category].empty?
    @expense.category = @category
    @expense.user = @user
    if @expense.save
      children = []
      params[:expense][:id].each do |id|
        children << Child.find(id) unless id.empty?
      end
      children.each do |child|
        @child_expense = ChildExpense.new
        @child_expense.expense = @expense
        @child_expense.child = child
        @child_expense.save
      end

      redirect_to families_path
    else
      render :new
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
