class MessagesController < ApplicationController
  before_action :find_private_chat
  
  def create
    @message = @private_chat.messages.new(message_params)
    @message.profile_id = current_user.profile.id

    if @message.save
      PrivateChatChannel.broadcast_to(
        @message.private_chat,
        render_to_string(partial: "message", locals: { message: @message })
      )
    end

    head :ok

  end

  private

  def find_private_chat
    @private_chat = PrivateChat.find(params[:private_chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
