class Post
  include Mongoid::Document

  field :title
  field :content
  field :published, type: Boolean, default: false

  embedded_in :user

  scope :drafts, where(published: false)
end
