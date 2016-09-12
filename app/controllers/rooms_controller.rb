class RoomsController < ApplicationController
  def index
    puts current_user
    @rooms = Room.all
  end

  def create
    redirect_to
    @room = Room.create(topic: params['topic'])
    if @room
      render partial: 'rooms/room', locals: {room: @room}
    else
      render :json => { :errors => @room.errors.full_messages }, status => 422
    end
  end

  def show
    redirect_to root_path if !current_user
    @room = Room.find_by(id: params[:id])
  end
end
