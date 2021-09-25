class BoardCommentsController < ApplicationController

  def create
    @board = Board.find(params[:board_id])
    @comment = BoardComment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.board_id = @board.id
    # if @comment.save
    #   @board.update(add_id: @comment.id)
    #   redirect_to board_path(@board)
    # else
    #   render 'index'
    # end
      if @comment.save
        @board.update(add_id: @comment.id)
      end


  end

  def destroy
    comment = BoardComment.find(params[:id])
    if comment.update(comment: "このコメントは削除されました")
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end


  private

  def comment_params
    params.require(:board_comment).permit(:comment, :user_id, :board_id)
  end

end
