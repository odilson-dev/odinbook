class PrivateChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_private_chat, only: [:show]
  def index
    if current_profile
      @profile = current_profile
      @private_chats = PrivateChat.where("profile1_id = ? OR profile2_id = ?", @profile.id, @profile.id).order("created_at DESC")
    else
      redirect_to login_path, notice: 'Please log in first.'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:profile_id])
    @private_chat = PrivateChat.find(params[:id])
    @message = Message.new
  end

  def find_private_chat
    @private_chat = PrivateChat.find(params[:id])
  end

  def private_chat_params
    params.require(:private_chat).permit(:profile1_id, :profile2_id)
  end
end
