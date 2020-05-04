class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(pseudo: params[:pseudo])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to places_url, notice: t('messages.login_confirmation')
    else
      flash.now[:notice] = t('messages.login_error')
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to places_url, notice: t('messages.logout')
  end
end
