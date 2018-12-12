class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal, :calendar, :photo

  def show
    @user = current_user
      case step
    when :personal
      @children = @user.children
    when :calendar

    end
    render_wizard
  end
end
