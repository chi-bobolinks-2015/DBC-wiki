class Article < ActiveRecord::Base
  has_many :edits
  belongs_to :category
  has_many :comments

  validates :category_id, presence: true
  validates :user_id, presence: true
  # validates :current_edit_id, presence: true
  
end
