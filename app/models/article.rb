class Article < ActiveRecord::Base
  has_many :edits, :dependent => :destroy
  belongs_to :category
  has_many :comments, :dependent => :destroy
  has_many :approved_edits, -> { where approved: true }, class_name: "Edit"

  validates :category_id, presence: true
  validates :user_id, presence: true

  def self.with_unapproved_edits
    # join the article with all its edits
    joins(:edits).where("edits.approved = ?", false).group(:id).having("count(*) > 0")
    # filter out edits that are approved
    # group by the article
    # get only articles with > 0 unapproved edits
  end

  def self.create_with_edit(category_id, user_id, title, content)
    article = Article.create!(:category_id => category_id, :user_id => user_id)
    edit = article.edits.create!(:author_id => user_id, :title => title, :content => content, :approved => false, :featured => false)  

    return article
  end

  def title
    return self.edits.last.title
  end

  def content
    return self.edits.last.content
  end

  def has_approved_edits?
    self.aprroved_edits.empty?
  end

end
