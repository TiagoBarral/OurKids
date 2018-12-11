class FamiliesController < ApplicationController
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
    @families = current_user.parentfamilies + current_user.coparentfamilies
  end

  def show

  end
end
