class Admins::HomesController < ApplicationController

  before_action :signed_in?

  def top
  end


  private

  def signed_in?
    if admin_signed_in?
      redirect_to admins_users_path
    end
  end
end
