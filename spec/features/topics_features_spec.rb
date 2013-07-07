require 'spec_helper'

feature  "topics" do
	 before do 
     @forum = FactoryGirl.create(:forum)
     @user = FactoryGirl.create(:user)
     @topic = FactoryGirl.create(:topic, user: @user, forum: @forum)
  end

    scenario  "should be viewable in a forum" do
      visit '/users/sign_in'
      fill_in 'user_email', with: 'ted@mail.com'
      fill_in 'user_password', with: 'aaaaaa'
      click_button 'Sign in'
      
      visit '/forums'
      click_link @forum.name
      fill_in 'topic_title', with: "creating a test topic"
      fill_in 'topic_body', with: "this is the topic content"
      click_button "Create Topic"
      within('.forum_topics') do
        page.should have_content("creating a test topic")
      end
    end

    scenario "topics link to the topic page" do
      visit '/users/sign_in'
      fill_in 'user_email', with: 'ted@mail.com'
      fill_in 'user_password', with: 'aaaaaa'
      click_button 'Sign in'
      
      visit '/forums'
      click_link @forum.name
      fill_in 'topic_title', with: "my second topic"
      fill_in 'topic_body', with: "this is the topic content"
      click_button "Create Topic"
      within('.forum_topics') do
        page.should have_content("my second topic")
      end
      click_link "my second topic"
      page.should have_selector('h1', text: "my second topic")
    end

    scenario "user creates a comment" do
      visit '/users/sign_in'
      fill_in 'user_email', with: 'ted@mail.com'
      fill_in 'user_password', with: 'aaaaaa'
      click_button 'Sign in'
      
      visit '/forums'
      click_link @forum.name
      click_link @topic.title
      fill_in 'comment_content', with: "what a lovely forum you have"
      click_button "Create Comment"
      within('.topic_comments') do
        page.should have_content("what a lovely forum you have")
      end
    end
end