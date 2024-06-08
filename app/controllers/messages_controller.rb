class MessagesController < ApplicationController
  before_action :find_private_chat
  
  def create
    @message = @private_chat.messages.new(message_params)
    @message.profile_id = current_user.profile.id
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:profile_id])
    @private_chat = PrivateChat.find(params[:private_chat_id])

    if @message.save
      redirect_back(fallback_location: root_path)
    end

  end
  


  private

  def find_private_chat
    @private_chat = PrivateChat.find(params[:private_chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
