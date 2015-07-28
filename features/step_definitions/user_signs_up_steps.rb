Given(/^I am not signed up$/) do
  expect(User.count).to eq(0)
end

When(/^I provide my details$/) do
  visit new_user_registration_path

  @user = FactoryGirl.build(:user)
  fill_in 'Username', with: @user.username
  fill_in 'Email', with: @user.email
  choose('Artist')
  fill_in 'Password', with: @user.password
  fill_in 'Password confirmation', with: @user.password
  click_button 'Sign up'
end

Then(/^my account is created$/) do
  expect(User.count).to eq(1)
end

Then(/^I receive a confirmation email$/) do
  expect(ActionMailer::Base.deliveries).not_to be_empty
end

Then(/^I am shown my profile$/) do
  expect(page).to have_content(@user.username)
end

When(/^I provide invalid details$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am told to correct my details$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am signed up$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I have forgotten my password$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I receive a password reset email$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I change my password$/) do
  pending # express the regexp above with the code you wish you had
end
