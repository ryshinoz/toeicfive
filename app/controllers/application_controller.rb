#coding:utf-8

require 'exceptions/examination_error.rb'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception  
  rescue_from RuntimeError, with: :runtime_error
  rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound, with: :routing_error
  rescue_from Toeicfive::ExaminationError, with: :examination_error

  helper_method :current_user

  def current_user
    begin
      @current_user ||=  User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound => ar
      logger.info "ユーザ情報がありません."
      session[:user_id] = nil
    end
  end

  private

  def runtime_error
    logger.error "アプリケーションエラーが発生しました"
    render "error/500", status:500
  end

  def routing_error
    logger.error "ルーティングエラーが発生しました"
    render "error/404"
  end

  def examination_error
    loger.error "試験データに問題が発生しました。"
    render "error/examination_error"
  end

end
