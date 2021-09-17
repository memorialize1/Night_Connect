class Admins::BoardsController < ApplicationController
  
  def new
    @board = Board.new
  end
  
  def index
    @boards = Board.page(params[:page]).reverse_order
    @select = Board.where(admin_id: [1])
  end
  
  def show
    @board = Board.find(params[:id])
  end
  
  def create
    @board = Board.new(board_params)
    @board.admin_id = current_admin.id
    @board.user_id = 3 #公式アカウント（belongs_toのため）
    if @board.save
      redirect_to admins_board_path(@board)
    else
      @boards = Board.page(params[:page]).reverse_order
      @select = Board.where(admin_id: [1])
      render 'index'
    end
  end
  
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to admins_boards_path
  end
  
  
  private
  
  def board_params
    params.require(:board).permit(:title, :genre_id, :admin_id)
  end
  
end
