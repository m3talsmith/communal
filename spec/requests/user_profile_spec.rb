require 'spec_helper'

describe 'User Profile' do

  context 'Registration' do

    it 'uses oauth' do
      User.count.should == 0
      
      visit root_path
      click_link 'Facebook'

      current_path.should == root_path
      User.count.should   == 1

      user = User.first
      user.providers.map(&:name).should include('default')
      page.should have_content("#{user.id} online")
    end

  end

  context 'Registered' do
    pending 'Waiting for user registration'
  end

end
