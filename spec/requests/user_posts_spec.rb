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
  
  context 'list all post' do
    
    before do
      @post       = Factory.create :published_post, user: @user
      @draft_post = Factory.create :draft_post, user: @user
      visit dashboard_path
      click_link 'view my posts'
    end
    
    it 'is on my posts path' do
      current_path.should == user_posts_path(@user)
    end
    
    it 'shows post title' do
      page.should have_content(@post.title)
    end
    
    it 'shows publish date' do
      page.should have_content(@post.published_date)
    end
    
    it 'shows create date' do
      page.should have_content(@post.created_at)
    end
    
    it 'shows publish status' do
      within('.post.published') do
        page.should have_content('Published')
      end
    end
    
    it 'shows links on post draft to publish' do
      all('.post.published').count.should == 1
      within('.post.draft') do
        click_link 'publish'
      end
      @draft_post.reload
      @draft_post.published.should be
      all('.post.published').count.should == 2
    end

    context 'editing a post' do

      before do
        within('.draft') do
          click_link 'edit'
        end
      end
    
      it 'publishes post from drop down' do
        select 'Published', from: 'Published'
        click_button 'save'
        
        @draft_post.reload
        @draft_post.published.should be
        page.should have_content('Post updated')
        current_path.should == user_post_path(@user, @draft_post)
      end
    end
  end
end
