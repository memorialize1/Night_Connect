class ChatCommentsController < ApplicationController
  
  def create
    @comment = Chat.new(chat_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    
  end
  
  
  def chat_params
    params.require(:chat).permit(:room_id, :user_id, :chat_comment)
  end
  
end
