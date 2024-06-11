class MessagesController < ApplicationController
  before_action :find_private_chat
  
  def create
    @message = @private_chat.messages.new(message_params)
    @message.profile_id = current_user.profile.id
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:profile_id])
    @private_chat = PrivateChat.find(params[:private_chat_id])


    notify_recipient

    if @message.save
      redirect_back(fallback_location: root_path)
    end

  end
  


  private

  def notify_recipient
    
    #joined_users is an instance method defined in the message.rb file to return an array of Users in the chatroom.
    users_in_room = @message.joined_users
  
    users_in_room.each do |user|

    next if user.eql?(current_user)

    #MessageNotification is created.
    notification = CommentNotifier.with(message: @message.content, author: current_user.username, type: "message")

    #MessageNotification is delivered to the recipient.
    notification.deliver(user)
    end
  end

  def find_private_chat
    @private_chat = PrivateChat.find(params[:private_chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
