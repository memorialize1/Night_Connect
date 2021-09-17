class BoardsController < ApplicationController
    
  def new
    @board = Board.new
  end
  
  def index
    @boards = Board.page(params[:page]).reverse_order
    @select = Board.where(admin_id: [1])
  end
  
  def show
    @board = Board.find(params[:id])
    @comment = BoardComment.new
  end
  
  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    if @board.save
      redirect_to board_path(@board)
    else
      @boards = Board.page(params[:page]).reverse_order
      @select = Board.where(admin_id: [1])
      render 'index'
    end
  end
  
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_path
  end
  
  
  private
  
  def board_params
    params.require(:board).permit(:title, :genre_id, :user_id)
  end
  
end
