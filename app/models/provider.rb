class Provider
  include Mongoid::Document

  field :name
  field :uid

  embedded_in :user
end
