class NewExpenseController < ApplicationController
  include Wicked::Wizard
  layout 'devise'

  steps :pick_date, :pick_title, :pick_amount, :pick_receipt, :pick_kids

  def show
    @expense = Expense.new
    case step
    when :pick_kids
      @children = current_user.children
    end
    render_wizard
  end

  def update
    case step
    when :pick_kids
      children = []
      params[:expense][:id].each do |id|
        children << Child.find(id) unless id.empty?
      end
      children.each do |child|
        @child_expense = ChildExpense.new
        @expense = Expense.last
        @child_expense.expense = @expense
        @child_expense.child = child
        @child_expense.save
      end
      return redirect_to families_path
    when :pick_date
      @expense = Expense.new(expense_params)
      @expense.user = current_user
      @category = Category.find(params[:expense][:category])  unless params[:expense][:category].empty?
      @expense.category = @category
    else
      @expense = Expense.last
      @expense.update(expense_params)
    end
    render_wizard @expense
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :description, :date, :percentage, :receipt, :amount)
  end
end
