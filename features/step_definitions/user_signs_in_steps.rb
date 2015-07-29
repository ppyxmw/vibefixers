Given(/^I am not signed in$/) do
  visit new_user_session_path
  expect(page).to have_content('Log in')
end

When(/^I sign in with my email address$/) do
  visit new_user_session_path
  @user = FactoryGirl.create(:existing_user)
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end

Then(/^I am shown my account$/) do
  expect(page).to have_content(@user.username)
end
