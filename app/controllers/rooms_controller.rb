class RoomsController < ApplicationController
  def index
    @rooms = Rooms.all
  end

  def show
    @messages = Message.all
  end
end
