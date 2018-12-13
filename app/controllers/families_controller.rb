class FamiliesController < ApplicationController
  before_action :find_family, only: [:show]

  def coparent
    @user = current_user
    UserMailer.invite(params[:coparent], @user).deliver_now
    redirect_to families_path
  end

  def new_coparent
  end

  def create
    @parent = User.find_by(email: params[:coparent][:coparent_email])
    @family = Family.new
    @family.parent = @parent
    @family.coparent = current_user
    if @family.save
      redirect_to families_path
    else
      render :new_coparent
    end
  end

  def index
    @families = current_user.families
    redirect_to family_path(@families.first) if @families.count == 1
  end

  def show
  end

  private

  def find_family
    @family = Family.find(params[:id])
  end
end
