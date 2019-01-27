class BestDaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :date, :quantity_sold
end
