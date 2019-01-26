class ApiErrorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :message, :date
end
