class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :nickname

  embeds_many :providers
  class << self
    
    def from_provider(omniauth_hash)
      provider = omniauth_hash['provider']
      uid      = omniauth_hash['uid']

      user_query = User.where('providers.name' => provider, 'providers.uid' => uid).first
      return user_query if user_query

      user = create(providers: [Provider.new(name: provider, uid: uid)])
      return user
    end

  end
end
