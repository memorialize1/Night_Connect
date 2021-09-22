class UsersController < ApplicationController
    
    def index
        @users = User.page(params[:page]).reverse_order
    end
    
    def show
        @user = User.find(params[:id])
        @boards = @user.boards
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(current_user.id), notice: "You have updated user successfully."
        else
            render "edit"
        end
    end
    
    
    def withdrow #退会画面を表示するアクション
       @user = User.find(params[:id])
    end

    def switch
       @user = User.find(params[:id])
       if @user.update(user_status: false)
          sign_out current_user #URLを踏ませずにコントローラーから直接サインアウトの指示を出す（device公式)
       end
       redirect_to root_path
    end
    
    
    
    
    private
    def user_params
        params.require(:user).permit(:name, :introduction, :image, :code, :genre_id)
    end
    
    def ensure_correct_user
            @user = User.find(params[:id])
        unless @user == current_user
            redirect_to user_path(current_user)
        end
    
    end
    
    
end
