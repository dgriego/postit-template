class Post < ActiveRecord::Base
  # deviating from the convention
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
end