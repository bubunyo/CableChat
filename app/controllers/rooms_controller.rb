class RoomsController < ApplicationController
  before_action :user_name_set, except: [:new, :enter]

  def new
    @rooms = Room.all
    @room = Room.new
  end

  def enter
    if params[:username].present?
      set_user(params[:username])
    else
      flash.now[:alert] = "Invalid username"
      render 'new'
      return
    end

    room_name = params[:room][:name]
    if room_name.blank?
      flash.now[:alert] = "Please Supply room name"
      render 'new'
      return
    end
    @room = Room.find_by name: room_name
    if @room.nil?
      @room = Room.new name: room_name
      if @room.save
        flash[:alert] = "You created #{@room.name} Chat Room"
        redirect_to rooms_path(room_name: @room.name)
      else
        flash.now[:alert] = "Something went wrong. Try agian"
        render 'new'
      end
    else
      redirect_to rooms_path(room_name: @room.name)
    end
  end

  def room
    @room = Room.find_by name: params[:room_name]
    if @room.nil?
      flash[:alert] = 'The chat room doesnt exist you have to create it'
      redirect_to root_path
    end
  end

  def leave
  end
end
