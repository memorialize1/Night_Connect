class RoomsController < ApplicationController
  
  def new
    
  end
  
  def index
    @user = User.find(current_user[:id])
    @room = Room.new
    # @rooms = @user.room_user
    
    
  end
  
  def show
    @room = Room.find(params[:id])
  end
  
  def edit
    @user = User.find(current_user[:id])
    @room = Room.find(params[:id])
    @follows = @user.followings
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to edit_room_path(@room)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def create2
    @room = Room.new(relation_room_params)
    if @room.save
      redirect_to edit_room_path(@room)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  
  private
  
  def room_params
    params.require(:room).permit(:relation_room_id, :name)
  end
  
  def relation_room_params
    params.require(:relation_room).permit(:room_id, :user_id)
  end
  
end
