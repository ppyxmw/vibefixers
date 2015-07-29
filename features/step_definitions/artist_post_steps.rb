Given(/^I am a signed in Artist$/) do
  visit new_user_registration_path
  @user = FactoryGirl.build(:user)
  fill_in 'Username', with: @user.username
  fill_in 'Email', with: @user.email
  choose('Artist')
  fill_in 'Password', with: @user.password
  fill_in 'Password confirmation', with: @user.password
  click_button 'Sign up'
  expect(page).to have_content(@user.username)
end

Given(/^I have no posts$/) do
  expect(@user.posts.count).to eq(0)
end

Given(/^I go to create a Post$/) do
  click_link 'Post'
  expect(page).to have_content('Sample')
end

When(/^I fill in all Post details$/) do
  @post = FactoryGirl.build(:post)
  fill_in 'Sample', with: @post.sample
  click_button 'Search'
  # select '...'
  fill_in 'Tags', with: @post.tags
  fill_in 'Summary', with: @post.summary
  fill_in 'Description', with: @post.description
  click_button 'Publish'
end

Then(/^my Post is created$/) do
  expect(@user.posts.count).to eq(1)
end
