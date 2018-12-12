class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal, :calendar, :photo

  def show
    @user = current_user
    @expense = Expense.new
    @children = @user.children

    case step
    when :personal

    when :calendar
    end
    render_wizard
  end


  def create
  end
  def update
    @user = current_user
    case step
    when :calendar
      @user.update_attributes(params[:user])
    end
    sign_in(@user, bypass: true) # needed for devise
    render_wizard @user
  end
end
