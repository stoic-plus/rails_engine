FactoryBot.define do
  factory :invoice do
    customer { nil }
    merchant { nil }
    status { "shipped" }
    created_at { 2.days.ago }
    updated_at { DateTime.now }
  end
end
