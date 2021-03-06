class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(params[:session])
    if user
      sign_in user
      redirect_to decks_path
    else
      render :new
    end
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to root_path
  end
end
