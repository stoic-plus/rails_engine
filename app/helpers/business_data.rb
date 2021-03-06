module BusinessData
  class TotalRevenueForDate
    @@count = 0
    attr_reader :total_revenue, :date, :id
    def initialize(total_revenue, date)
      @id = @@count
      @@count += 1
      @total_revenue = total_revenue
      @date = date
    end
  end
  class TotalRevenue
    @@count = 0
    attr_reader :total_revenue, :id
    def initialize(total_revenue)
      @id = @@count
      @@count += 1
      @total_revenue = total_revenue
    end
  end
  class BestDay
    @@count = 0
    attr_reader :quantity_sold, :date, :id
    def initialize(best_day)
      @id = @@count
      @@count += 1
      @quantity_sold = best_day.quantity_sold
      @date = best_day.day
    end
  end
  class ApiError
    @@count = 0
    attr_reader :message, :date, :id
    def initialize(message, date)
      @id = @@count
      @@count += 1
      @message = message
      @date = date
    end
  end
end
