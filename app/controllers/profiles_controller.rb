class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'The user profile has been successfully updated.'
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :birthdate, :email, :password)
  end
end
