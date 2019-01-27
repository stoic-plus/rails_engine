class TotalRevenueForDateSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :total_revenue, :date
end
