class Admins::BoardCommentsController < ApplicationController
  
  def destroy
    comment = BoardComment.find(params[:board_id])
    if comment.update(comment: "このコメントは削除されました")
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
end
