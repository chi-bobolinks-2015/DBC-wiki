class Article < ActiveRecord::Base
  has_many :edits
  belongs_to :category
end
