class InquiriesController < ApplicationController
    
    def index
        @answers = Inquiry.where(user_id: current_user.id)
    end
    
    def show
        @inquiry = Inquiry.find(params[:id])
    end
    
    def new
        @inquiry = Inquiry.new
    end
    
    def create
        @inquiry = Inquiry.new(inquiry_params)
        @inquiry.user_id = current_user.id
        if @inquiry.save
            redirect_to inquiries_path
        else
            redirect_back(fallback_location: root_path)
        end
    end
    
    
    
    private
    
    def inquiry_params
        params.require(:inquiry).permit(:title, :inquiry, :user_id, :reading, :mail_status)
    end
    
    
end
