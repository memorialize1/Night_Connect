class RelationRoomsController < ApplicationController
  
  def create
    @user = User.find(params[:relationship][:follow_id])
    @room = Room.find(params[:room_id])
    nill = @room.participant_user(@room, @user)
    if nill.save
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
  
  
end
