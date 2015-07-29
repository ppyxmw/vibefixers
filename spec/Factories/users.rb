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

    factory :invalid_user do
      email 'not a real email'
    end

    factory :existing_user do
      username 'oldboy'
      email 'oldboy@school.com'
    end
  end
end
