FactoryBot.define do
  factory :transaction do
    invoice { nil }
    credit_card_number { 1 }
    credit_card_expiration_date { "2019-01-23 11:51:54" }
    result { "success" }
  end
  factory :failed_transaction, parent: :transaction do
    result { "failed" }
  end
end
