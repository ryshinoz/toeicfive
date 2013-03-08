class BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 # protect_from_forgery with: :null_session
  protect_from_forgery with: :exception  

#  helper_method :current_user
#
#  def current_user
#    begin
#      @current_user ||=  User.find(session[:user_id]) if session[:user_id]
#    rescue ActiveRecord::RecordNotFound => ar
#      logger.info "ユーザ情報がありません."
#      session[:user_id] = nil
#    end
#  end

end
