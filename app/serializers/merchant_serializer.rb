class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
  # attribute :transaction_count, if: Proc.new {|record| record.transaction_count.present? }
end
