#coding: utf-8

class ExaminationController < ApplicationController

  def index  
    @examinations = Examination.all
  end

  def show
     @examination = Examination.find(params[:id]) 
     @answer     = Answer.where("user_id = ?",current_user.id).where("examination_id = ?",params[:id])
  end

  def today_word
    @examination = Examination.today_examination
  end

  def answer
    if params[:understand]
      current_user.answer_examination params[:examination_id], params[:understand]
    end
    redirect_to action:'index'
  end

end
