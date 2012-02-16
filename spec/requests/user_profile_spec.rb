require 'spec_helper'

describe 'User Profile' do

  context 'Registration' do
    
    before do
      User.count.should == 0
      visit root_path
    end

    it 'uses facebook' do
      click_link 'Facebook'

      current_path.should == dashboard_path
      User.count.should   == 1

      user = User.first
      user.providers.map(&:name).should include('facebook')
      page.should have_content("#{user.id} online")
    end

    it 'uses twitter' do
      click_link 'Twitter'

      current_path.should == dashboard_path
      User.count.should   == 1

      user = User.first
      user.providers.map(&:name).should include('twitter')
      page.should have_content("#{user.id} online")
    end

    it 'uses google' do
      click_link 'Google'

      current_path.should == dashboard_path
      User.count.should   == 1

      user = User.first
      user.providers.map(&:name).should include('google_oauth2')
      page.should have_content("#{user.id} online")
    end
    
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

    it 'adds twitter to providers' do
      click_link 'Profile'

      page.should_not have_content('Add Facebook')
      page.should     have_content('Remove Facebook')

      click_link 'Add Twitter'
      
      @user.reload
      current_path.should == profile_path
      page.should_not have_content('Add Twitter')
      page.should     have_content('Remove Twitter')
      @user.providers.map(&:name).should include('twitter')
    end

    it 'removes twitter from providers' do
      click_link 'Profile'
      click_link 'Add Twitter'

      @user.reload
      current_path.should == profile_path
      page.should_not have_content('Add Twitter')
      page.should     have_content('Remove Twitter')
      @user.providers.map(&:name).should include('twitter')
      
      click_link 'Remove Twitter'
      
      @user.reload
      current_path.should == profile_path
      page.should_not have_content('Remove Twitter')
      page.should     have_content('Add Twitter')
      @user.providers.map(&:name).should_not include('twitter')
    end

  end

end
