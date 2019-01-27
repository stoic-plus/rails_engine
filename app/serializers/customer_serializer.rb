class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :first_name, :last_name
  # attribute :transaction_count, if: Proc.new { |record| record.transaction_count }
end
