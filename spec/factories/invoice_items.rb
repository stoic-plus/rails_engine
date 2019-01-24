FactoryBot.define do
  factory :invoice_item do
    item { nil }
    invoice { nil }
    sequence(:quantity) {|n| ("#{n}".to_i+1)*2 }
    sequence(:unit_price) {|n| ("#{n}".to_i+1)*3 }
  end
end
