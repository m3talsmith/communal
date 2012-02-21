# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title 'test post'
    
    factory :draft_post do
      published false
    end
    
    factory :published_post do
      published      true
      published_date {Time.now}
    end
  end
end
