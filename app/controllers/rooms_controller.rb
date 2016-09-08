class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def create
    @room = Room.create(topic: params['topic'])
    puts @room
    if @room
      render partial: 'rooms/room', locals: {room: @room}
    else
      render :json => { :errors => @room.errors.full_messages }, status => 422
    end
  end

  def show
    @room = Room.includes(:messages).find_by(id: params[:id])
    # if @room
    #   render partial: 'rooms/show', locals: {room: @room}
    # else
    #   render :json => { :errors => @room.errors.full_messages }, status => 422
    # end
  end
end
