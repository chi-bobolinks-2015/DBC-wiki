class Category < ActiveRecord::Base
  has_many :articles

  validates :name, presence: true, allow_nil: false
end
