class ProfilesController < ApplicationController
  before_action :set_user
  
  def show
    # Find the Profile record with the given user_id
    @profile = Profile.find_by(user_id: params[:id])

    # Check if the @profile is found
    if @profile
      # If found, get the associated user and posts
      @user = @profile.user
      @posts = @user.posts
    else
      # If not found, handle the error accordingly
      # For example, you can redirect to a 404 page
      # or render an error message
      render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
    end
  end

  def follow
    current_user.send_follow_request_to(@user)
    redirect_to request.original_url
  end

  def unfollow
    make_it_a_unfriend_request

    current_user.unfollow(@user)
    redirect_to request.original_url
  end

  def accept
    current_user.accept_follow_request_of(@user)
    make_it_a_friend_request
    redirect_to root_path
  end

  def decline
    current_user.decline_follow_request_of(@user)
    redirect_to root_path
  end

  def cancel
    current_user.remove_follow_request_for(@user)
    redirect_to root_path
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

  def create_chat
    @selected_user_profile = Profile.find(params[:id])
    profile1_id = current_user.id
    profile2_id = @selected_user_profile.id

    
    if current_user.id == @selected_user_profile.id
      flash[:alert] = "You cannot send a message to yourself."
      redirect_to user_profile_path(current_user, @selected_user_profile) and return
    end

    @private_chat = PrivateChat.get_private_chat(profile1_id, profile2_id)

    unless @private_chat
      @private_chat = PrivateChat.create(profile1: current_user.profile, profile2: @selected_user_profile)
    end

    redirect_to user_profile_private_chat_path(current_user, current_user.profile, @private_chat)

  end


  private

  def make_it_a_friend_request
    current_user.send_follow_request_to(@user)
    @user.accept_follow_request_of(current_user)
  end

  def make_it_a_unfriend_request
    @user.unfollow(current_user) if @user.mutual_following_with?(current_user)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :birthdate, :email, :password)
  end
end
