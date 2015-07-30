FactoryGirl.define do
  factory :post do
    title "This is my title"
    tags "A couple of tags"
    user nil
    summary "I will summarise"
    description "Let me describe this for you"
    artwork "www.photo2324.com"
  end
end
