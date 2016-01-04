# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from room_name
    if not @room.nil?
      @room.count += 1
      @room.save
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    if not @room.nil?
      @room.count -= 1
      if @room.count < 1
        @room.destroy
      else
        @room.save
      end
    end
  end

  def send_message(data)
    ActionCable.server.broadcast "room_#{@room.name}", message: data['message'], user: data['user'], hex: data['hex']
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
