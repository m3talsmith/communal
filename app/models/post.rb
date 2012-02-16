class Post
  include Mongoid::Document

  field :title
  field :content
  field :published, type: Boolean, default: false

  belongs_to :user

  scope :drafts, where(published: false)
end
