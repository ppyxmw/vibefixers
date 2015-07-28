FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@email.com"
  end

  sequence :username do |n|
    "username#{n}"
  end

  factory :user do
    username
    email
    password 'password'
  end
end
