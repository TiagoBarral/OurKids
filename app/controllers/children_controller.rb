class ChildrenController < ApplicationController
  before_action :find_family, only: [:new, :create, :expenses]

  def new
    @child = Child.new
  end

  def create
    params[:child][:gender] = params[:child][:gender].to_i
    @child = Child.new(child_params)
    @child.save
    @fam_child = FamilyChild.new
    @fam_child.child = @child
    @fam_child.family = @family
    if @fam_child.save
      redirect_to families_path
    else
      render :new
    end
  end

  def expenses
    @child = Child.find(params[:id])
    @expenses = @child.expenses
  end

  private

  def child_params
    params.require(:child).permit(:first_name, :last_name, :gender, :photo)
  end

  def find_family
    @family = Family.find(params[:family_id])
  end
end
