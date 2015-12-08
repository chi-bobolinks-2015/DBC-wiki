class Edit < ActiveRecord::Base
  belongs_to :approver, class_name: "User"
  belongs_to :author, class_name: "User"
  belongs_to :article

  validates :article_id, presence: true
  # validates :author_id, presence: true
  # validates :approved, inclusion: { in: [true, false] }
  validates :content, presence: true, length: { minimum: 5 }
  validates :title, presence: true
end
