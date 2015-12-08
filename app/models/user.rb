class User < ActiveRecord::Base
  has_many :approved_edits, class_name: "Edit", foreign_key: "approved_by_id"
  has_many :edits, foreign_key: "author_id"
  has_many :created_articles, class_name: "Article"

  validates :username,:email, presence: true
  validates :email, uniqueness: true, format: { with: /\A.+@.+\..+\z/ }
  validates_presence_of :password, :on => :create


  attr_accessible :email, :password, :password_confirmation
  has_secure_password
end
