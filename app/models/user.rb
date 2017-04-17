class User < ActiveRecord::Base
  # assumes foreign key named post_id
  has_many :posts
  has_many :comments

  # whenever registering a new user we want to make sure
  # the username is unique
  validates :username, presence: true, uniqueness: true

  # whenever password is sent in through controller
  # and save is triggered.. the validation will be hit
  # validates :password, presence: true, on: :create, length: {minimum: 5}

  has_secure_password
end
