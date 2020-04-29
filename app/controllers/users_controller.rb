class UsersController < InheritedResources::Base
  before_action :set_check_user, only: [:show, :edit, :update, :destroy]

  # GET /users/1
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)
    set_language(@user)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: t('messages.register') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        set_language(@user)
        format.html { redirect_to @user, notice: t('messages.edit') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to places_path, notice: t('messages.delete_user') }
    end
  end

  private

  # Set language depending on the selected code or the current value in the cookie
  def set_language(user)
    if user.language_id
      cookies[:language] = Language.find(user.language_id).code
    else
      user.language_id = Language.find_by_code(cookies[:language]).id
    end
  end

  # Set and check user with the id parameter
  def set_check_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user), notice: t('messages.redirection')
    end
  end

  # User params
  def user_params
    params.require(:user).permit(:pseudo, :email, :language_id, :password, :password_confirmation)
  end
end
