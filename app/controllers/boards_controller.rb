class BoardsController < ApplicationController
    
  def new
    @board = Board.new
  end
  
  def index
    @boards = Board.page(params[:page]).reverse_order
    @select = Admin.board.where
  end
  
  def show
  end
  
  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    @board.tag = "user"
    if @board.save
      redirect_to board_path(@board)
    else
      @boards = Board.page(params[:page]).reverse_order
      render 'index'
    end
  end
  
  def destroy
  end
  
  
  private
  
  def board_params
    params.require(:board).permit(:title, :genre_id, :user_id, :tag)
  end
  
end
