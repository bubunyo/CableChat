# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from room_name
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    # ActionCable.server.broadcast "channel_#{data[room]}", message: data[:message], user: data[:user]
    ActionCable.server.broadcast "room_#{@room.name}", message: data['message'], user: data['user']
  end

  private
  def room_name
    @room = Room.find_by name: params[:room]
    if not @room.nil?
      "room_#{@room.name}"
    else
      'room_public'
    end
  end
end
