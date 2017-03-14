class User < ActiveRecord::Base
  # assumes foreign key named post_id
  has_many :posts
  has_many :comments
end