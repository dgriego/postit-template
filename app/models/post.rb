class Post < ActiveRecord::Base
  # deviating from the convention
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true, length: {minimum: 5}
  validates :url, presence: true
  validates :description, presence: true, uniqueness: true
end