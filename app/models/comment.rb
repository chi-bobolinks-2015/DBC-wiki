class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :commenter, class_name: "User"

  validates :content, presence: true
  validates :article_id, presence: true
  validates :commenter_id, presence: true

  extend Search
end
