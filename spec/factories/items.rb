FactoryBot.define do
  factory :item do
    sequence(:name) {|n| "item_name #{n}" }
    sequence(:description) {|n| "item_desc #{n}" }
    unit_price {|n| ("#{n}".to_i+1)*3}
    merchant { nil }
  end
end
