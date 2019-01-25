FactoryBot.define do
  factory :transaction do
    invoice { nil }
    credit_card_number { rand(1000000000000000) }
    credit_card_expiration_date { DateTime.parse(rand(1.year.ago..Time.now).to_s) }
    result { "success" }
  end
  factory :failed_transaction, parent: :transaction do
    result { "failed" }
  end
end
