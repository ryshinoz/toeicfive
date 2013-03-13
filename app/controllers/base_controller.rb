class BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  protect_from_forgery with: :exception  

#  rescue_from ActiveRecord::RecordNotFound, with: :routing_error
#  rescue_from ActionController::RoutingError, with: :routing_error
#
#  private
#  def routing_error
#    p "ROUTING ERROR"
#    logger.error "ルーティングエラーが発生しました"
#    render "error/404"
#  end

end
