class Admins::AnswersController < ApplicationController
  
  def index
     @answers = Inquiry.all
  end
  
  def show
    @answer = Answer.new
    @inquiry = Inquiry.find(params[:id])
    #自動既読判定
    unless @inquiry.reading == false
      @inquiry.reading = false
      @inquiry.update(inquiry_params)
    end 
  end
  
  
  def create
    @answer = Answer.new(answer_params)
    dess = @answer.inquiry_id
    nill = Inquiry.find(dess)
    if @answer.save
      #下記更新日時登録のため
      nill = Inquiry.find(dess)
      gss = @answer.id
      nill.update(add_id: gss)
      redirect_to admins_answer_path(@answer.inquiry_id)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def update
    status = Inquiry.find(params[:id])
    status.update(status_params)
    redirect_to admins_answers_path
  end
  
  private
  
  def answer_params
    params.require(:answer).permit(:title, :answer, :inquiry_id)
  end
  
  def inquiry_params
    params.permit(:reading, :mail_status)
  end
  
  def status_params
    params.require(:inquiry).permit(:mail_status)
  end

end
