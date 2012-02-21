class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content
  field :published,      type: Boolean, default: false
  field :published_date, type: DateTime
  
  validates :title, presence: true

  belongs_to :user

  scope :drafts, where(published: false)
end
