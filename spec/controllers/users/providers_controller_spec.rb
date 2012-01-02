require 'spec_helper'

describe Users::ProvidersController do
  
  before do
    @user = Factory.create :user
    @user.add_provider({name: 'facebook', uid: '1234'})
  end

  it 'adds twitter'
end
