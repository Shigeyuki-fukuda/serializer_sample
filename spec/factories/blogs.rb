FactoryBot.define do
  factory :blog do
    sequence(:title) { |n| "title#{n}" }
    sequence(:content) { |n| "content#{n}"}
  end
end
