class User < ActiveRecord::Base
  has_many :approved_edits, class_name: "Edit", foreign_key: "approved_by_id"
  has_many :edits, foreign_key: "author_id"
  has_many :created_articles, class_name: "Article"
  has_many :comments, foreign_key: "commenter_id"

  validates :username,:email, presence: true
  validates :email, uniqueness: true, format: { with: /\A.+@.+\..+\z/ }

  validates :password, length: { minimum: 1 }
  validates_presence_of :password, :on => :create
  has_secure_password

  def self.order_by_username
    order('username ASC')
  end
end
