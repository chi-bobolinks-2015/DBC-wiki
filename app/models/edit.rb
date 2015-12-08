class Edit < ActiveRecord::Base
  belongs_to :approver, class_name: "User"
  belongs_to :author, class_name: "User"
  belongs_to :article

  validates :article_id, presence: true
  validates :author_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
end
