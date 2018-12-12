class ExpensesController < ApplicationController
  before_action :find_family, only: [:index, :create]

  def index
    @expenses = []
    @family.children.each do |child|
      @expenses << child.expenses
    end
    @expenses
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
    @family = Family.find(params[:family])
    @children = params[:children]
    @num_expenses = children.size
    @amount = params[:amount] / @num_expesnes

    @children.each do |child|

      @expense.user_id = @user
      @expense.chil_id = @child
      @expenses.amount = @amount
      if@expense.save
        redirects family_expenses_path
      else
        render :new
      end
    end

  end

  private

  def expense_params
    params.require(:expense).permit(:title, :description, :date, :percentage, :receipt, :amount, :category)
  end

  def find_family
    @family = Family.find(params[:family_id])
  end
end
