class ChildrenController < ApplicationController
  before_action :find_family, only: [:new, :create]

  def new
    @child = Child.new
  end

  def create
    @child = Child.create(child_params)
    @fam_child = FamilyChild.new
    @fam_child.child = @child
    @fam_child.family = @family
    if @fam_child.save
      redirect_to families_path
    else
      render :new
    end
  end

  private

  def child_params
    params.require(:child).permit(:first_name, :last_name, :photo)
  end

  def find_family
    @family = Family.find(params[:family_id])
  end
end
