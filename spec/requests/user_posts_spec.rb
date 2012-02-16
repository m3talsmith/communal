require 'spec_helper'

describe 'User Posts' do

  before do
    @user = login_facebook
    visit dashboard_path
  end

  context 'Drafts' do

    it 'drafts a post' do
      @user.posts.count.should        == 0
      @user.posts.drafts.count.should == 0

      click_link 'create a post'
      fill_in 'Title',   with: 'post draft test'
      fill_in 'Content', with: 'Testing post drafts'
      click_button 'save'
      
      current_path.should             == dashboard_path
      @user.reload
      @user.posts.count.should        == 1
      @user.posts.drafts.count.should == 1
      page.should have_content('A new post has been drafted')
    end

    context 'that exists' do

      before do
        3.times {Factory.create :draft_post, user: @user}
        3.times {Factory.create :published_post, user: @user}
      end

      it 'lists all drafts' do
        click_link 'view drafts'

        all('.post.draft').count.should         == 3
        all('.post.published').count.should_not == 3
        all('.post.published').count.should     == 0
      end

      it 'views a draft'
      it 'publishes a draft'

    end

  end

end
