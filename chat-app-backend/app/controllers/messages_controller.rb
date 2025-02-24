# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  # POST /messages
  def create
    @message = Message.new(message_params)
    if @message.save
      # Broadcast the message via ActionCable (optional for real-time)
      ActionCable.server.broadcast('messages_channel', @message)
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  # Strong parameters for message creation
  def message_params
    params.require(:message).permit(:content, :user)
  end
end
