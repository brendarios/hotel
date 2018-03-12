module Hotel

  class DatesRange

    attr_reader :checkin, :checkout

    def initialize(start_date, end_date)
      @checkin = start_date
      @checkout = end_date
      date_validation
    end

    def date_validation
      return true if @checkin < @checkout
      raise ArgumentError.new("Your date is not a valid input")
    end

    def amount_days
      (@checkout - @checkin).to_i
    end

    def include?(date)
      return true if @checkin <= date && @checkout > date
      return false
    end

    def overlap?(another)
      return true if another.checkin <= self.checkin && another.checkout > self.checkin
      return true if another.checkin >= self.checkin && another.checkin < self.checkout
      return false
    end

  end
end
