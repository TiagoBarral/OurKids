class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]
  layout 'landing', only: [:landing]

  def landing
  end

  def dashboard
    @families = current_user.families
  end
end
