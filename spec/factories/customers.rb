FactoryBot.define do
  factory :customer do
    sequence(:first_name) {|n| "customer first #{n}" }
    sequence(:last_name) {|n| "customer last #{n}" }
  end
end
