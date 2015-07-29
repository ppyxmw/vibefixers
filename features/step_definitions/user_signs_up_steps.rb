Given(/^I am not signed up$/) do
  expect(User.count).to eq(0)
end

When(/^I provide my details$/) do
  visit new_user_registration_path
  @user = FactoryGirl.build(:user)
  fill_in 'Username', with: @user.username
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  fill_in 'Password confirmation', with: @user.password
end

Then(/^my artist account is created$/) do
  choose('Artist')
  click_button 'Sign up'
  expect(User.count).to eq(1)
  expect(User.last.artist).to be true
end

Then(/^I am shown my new profile$/) do
  expect(page).to have_content(@user.username)
end

Then(/^I receive a confirmation email$/) do
  expect(ActionMailer::Base.deliveries).not_to be_empty
end

Then(/^my fan account is created$/) do
  choose('Fan')
  click_button 'Sign up'
  expect(User.count).to eq(1)
  expect(User.last.artist).to be false
end

When(/^I provide invalid details$/) do
  visit new_user_registration_path
  @user = FactoryGirl.build(:invalid_user)
  fill_in 'Username', with: @user.username
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  fill_in 'Password confirmation', with: @user.password
  click_button 'Sign up'
end

Then(/^I am notified of an error$/) do
  expect(page).to have_content('error')
end

Given(/^I am signed up$/) do
  @user = FactoryGirl.create(:user)
end

When(/^I have forgotten my password$/) do
  visit new_user_session_path
  click_link 'Forgot your password?'
  fill_in 'Email', with: @user.email
  click_button 'Send me reset password instructions'
end

Then(/^I receive a password reset email$/) do
  @email = ActionMailer::Base.deliveries.last
  expect(@email).to have_content(@user.username)
end

Then(/^I change my password$/) do
  uri = URI(URI.extract(@email.body.decoded).last)
  reset_uri = uri.path + '?' + uri.query
  visit reset_uri
  fill_in 'New password', with: 'newpassword'
  fill_in 'Confirm new password', with: 'newpassword'
  click_button 'Change my password'
end

