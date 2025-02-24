class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    message = Message.create(content: data['content'], user: data['user'])
    ActionCable.server.broadcast("messages_channel", message)
  end
end