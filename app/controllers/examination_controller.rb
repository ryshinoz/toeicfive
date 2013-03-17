#coding: utf-8

class ExaminationController < ApplicationController
  def today_word
    @examination = Examination.today_examination
  end
end
