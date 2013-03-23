#coding: utf-8

class ExaminationController < ApplicationController
  def today_word
    @examination = Examination.today_examination
  end

  def answer
    current_user.answer_examination params[:examination_id], params[:understand]
  end
end
