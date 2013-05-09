require 'spec_helper'

feature  "topics" do
	let(:forum) { FactoryGirl.create(:forum)}
	before do 
    @topic = forum.topics.build(title: "test topic for features tests", body: "this is the topic content")
    FactoryGirl.create(:user)
  end

    scenario  "should be viewable in a forum" do
      visit '/users/sign_in'
      fill_in 'user_email', with: 'ted@mail.com'
      fill_in 'user_password', with: 'aaaaaa'
      click_button 'Sign in'
      
      visit '/forums'
      click_link forum.name
      fill_in 'topic_title', with: "creating a test topic"
      fill_in 'topic_body', with: "this is the topic content"
      click_button "Create Topic"
      within('.forum_topics') do
        page.should have_content("creating a test topic")
      end
    end

end