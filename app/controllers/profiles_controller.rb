class ProfilesController < ApplicationController
  def update
    @profile = current_user.profile
    if @profile.update(params[:profile].permit(:location, :about, :birthday, :phone, :avatar))
      flash[:notice] = "Successfully updated profile."
      redirect_to session.delete(:return_to)
    else
      render 'edit'
    end
    @profile.save!
  end

  def edit
    @profile = current_user.profile
    session[:return_to] ||= request.referer
  end
end
