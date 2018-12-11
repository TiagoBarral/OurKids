class FamiliesController < ApplicationController
  def new
    @family = Family.new
  end

  def create
    @family = Family.new
    @family.parent = current_user
    redirect_to families_path
  end
end
