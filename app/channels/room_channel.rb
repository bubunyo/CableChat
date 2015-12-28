# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "channel_o"
    puts '>>>>>f',room
    room = Room.find_by name: params[:room_name]
    puts params
    puts room
    if not room.nil?
      stream_from "channel_#{@room.name}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    # ActionCable.server.broadcast "channel_#{data[room]}", message: data[:message], user: data[:user]
    ActionCable.server.broadcast "channel_o", message: data['message'], user: data['user']
  end
end
