ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "forumapp.com",
  :user_name            => "rhuberdeau@gmail.com",
  :password             => "q(xx@$rp",
  :authentication       => "plain",
  :enable_starttls_auto => true
}