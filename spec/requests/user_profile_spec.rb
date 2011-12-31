require 'spec_helper'

describe 'User Profile' do

  context 'Registration' do

    it 'uses facebook' do
      User.count.should == 0
      
      visit root_path
      click_link 'Facebook'

      current_path.should == dashboard_path
      User.count.should   == 1

      user = User.first
      user.providers.map(&:name).should include('facebook')
      page.should have_content("#{user.id} online")
    end

    it 'uses twitter' do
      User.count.should == 0
      
      visit root_path
      click_link 'Twitter'

      current_path.should == dashboard_path
      User.count.should   == 1

      user = User.first
      user.providers.map(&:name).should include('twitter')
      page.should have_content("#{user.id} online")
    end

    it 'uses google'
    it 'uses foursquare'
    it 'uses identity'

  end

  context 'Registered' do
    
    before do
      visit root_path
      click_link 'Facebook'
      
      current_path.should == dashboard_path

      @user = User.first
    end

    it 'updates my nickname' do
      @user.set(:nickname, 'juju')

      click_link 'Profile'

      fill_in 'Nickname', with: 'jujubear'
      click_button 'save'

      @user.reload
      @user.nickname.should == 'jujubear'
      current_path.should   == dashboard_path
    end

  end

end
