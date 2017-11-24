class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do 
    flash[:danger] = "Record not found!"
    redirect_to root_path
  end
end
