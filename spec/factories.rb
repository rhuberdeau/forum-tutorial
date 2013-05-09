FactoryGirl.define do
  factory :forum do
    name 'factory girl focrum'
    description 'forum created with factory girl'
  end
  factory :user do
  	email 'ted@mail.com'
  	password 'aaaaaa'
  	password_confirmation 'aaaaaa'
  	confirmed_at Time.now
  end
end