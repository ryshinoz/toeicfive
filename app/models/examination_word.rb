class ExaminationWord < ActiveRecord::Base
  belongs_to :examination
  belongs_to :word
end
