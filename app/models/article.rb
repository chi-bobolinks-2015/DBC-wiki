class Article < ActiveRecord::Base
  has_many :edits
  belongs_to :category

  validates :category_id, presence: true
  validates :user_id, presence: true
  # validates :current_edit_id, presence: true
  def self.with_unapproved_edits
    # join the article with all its edits
    joins(:edits).where("edits.approved = ?", false).group(:id).having("count(*) > 0")
    # filter out edits that are approved
    # group by the article
    # get only articles with > 0 unapproved edits
  end
end
