class RelationRoomsController < ApplicationController
  
  def create
    @user = User.find(params[:relation_room][:participant_id])
    @room = Room.find(params[:room_id])
    nill = participant_user(@room, @user)
    if nill.save
      @room.update(relation_room_id: nill.id)
      flash[:success] = 'プレイヤーを追加しました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alate] = 'プレイヤーを追加に失敗しました。'
      redirect_back(fallback_location: root_path)
    end
  end
  
  
  def destroy
    @room = Room.find(params[:id])
    nill = @room.release(@room, @user)
    if nill.destroy
      flash[:success] = 'ユーザーを追放しました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'ユーザーの追放に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def participant_user(room, other_user)
      RelationRoom.find_or_create_by(room_id: room.id, participant_id: other_user.id)
      #find_or_create_byとは・・・同じ組み合わせが無いか探し、なければ作成(.new .)
  end
  
end
