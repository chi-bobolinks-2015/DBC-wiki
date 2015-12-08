class Article < ActiveRecord::Base
  has_many :edits
  belongs_to :category

  validates :category_id, presence: true
  validates :user_id, presence: true
  
end
