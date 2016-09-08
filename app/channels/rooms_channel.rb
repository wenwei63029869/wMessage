# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rooms_#{params[:room_id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create(content: data['content'], room_id: data['room_id'], user_id: data['user_id'])
  end
end
