class Group < ActiveRecord::Base
  validates :name ,presence: true ,length: {within: 2..30}

  has_many :user_groups
  has_many :users, through: :user_groups
end
