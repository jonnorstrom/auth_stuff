class UsersController < ApplicationController

  # shows the reg form
  def new
    @user = User.new
  end

  # POST req to reg a new user
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  # shows the edit form
  # 'users/3/edit'
  def edit
    if @user = current_user ## true - b/c I'm logged in
      if @user.id != params[:id].to_i ## FALSE
        redirect_to edit_user_path(@user)
      end
    else
      flash[:errors] = ["You must be logged in to go there"]
      redirect_to login_path
    end
    ## do something - render :edit
  end

  # POST req to up a user's info
  def update

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
