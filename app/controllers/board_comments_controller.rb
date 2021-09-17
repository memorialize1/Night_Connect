class BoardCommentsController < ApplicationController
  
  def create
    @board = Board.find(params[:board_id])
    @comment = BoardComment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.board_id = @board.id
    if @comment.save
      redirect_to board_path(@board)
    else
      render 'index'
    end
  end
  
  def destroy
    @board = Board.find(params[:board_id])
    comment = BoardComment.find(params[:id])
    if comment.update(comment: "このコメントは削除されました")
      redirect_to board_path(@board)
    else
      @board = Board.find(params[:board_id])
    end
  end
  
  
  private
  
  def comment_params
    params.require(:board_comment).permit(:comment, :user_id, :board_id)
  end
  
end
