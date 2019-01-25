FactoryBot.define do
  factory :merchant do
    sequence(:name) {|n| "merch_name #{n}" }
  end
end
