FactoryGirl.define do
  factory :forum do
    name 'factory girl forum'
    description 'forum created with factory girl'
  end

  factory :user do
  	email 'ted@mail.com'
  	password 'aaaaaa'
  	password_confirmation 'aaaaaa'
  	confirmed_at Time.now
  end

  factory :topic do
    title 'factory girl topic'
    body 'this is the topic content'
    user
    forum
  end
end