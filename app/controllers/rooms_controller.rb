class RoomsController < ApplicationController
  
  def new
    
  end
  
  def index
    @rooms = Room.all
    # byebug
    @room = Room.new
    
    
  end
  
  def show
    @room = Room.find(params[:id])
    @comment = Chat.new
  end
  
  def edit
    @user = User.find(current_user[:id])
    @room = Room.find(params[:id])
    @follows = @user.followings
    @set_room_user = RelationRoom.new
    
  end
  
  
  def group_edit
    @room = Room.find(params[:id])
  end
  
  
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      user = current_user
      nill = relation_room_create(@room, user)
      nill.save
      redirect_to edit_room_path(@room)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def update2
    
    menber = RelationRoom.find(params[:id]) 
    @room = Room.find(menber.room_id)
    menber.destroy
    if @room.relation_rooms.find_by(participant_id: current_user.id)
      redirect_back(fallback_location: root_path)
    else
      redirect_to rooms_path
    end
    
  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end
  
  
  private
  
  def relation_room_create(room, other_user)
      RelationRoom.find_or_create_by(room_id: room.id, participant_id: other_user.id)
      #find_or_create_byとは・・・同じ組み合わせが無いか探し、なければ作成(.new .)
  end
  
  def room_params
    params.require(:room).permit(:relation_room_id, :name)
  end
  
  def neme_edit
    params.permit(:name)
  end
  
  def relation_room_params
    params.permit(:room_id, :participant_id)
  end
  
end
