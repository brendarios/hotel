module Hotel

  class DatesRange #This class manages the date range

    attr_reader :checkin, :checkout

    def initialize(start_date, end_date)
      @checkin = start_date
      @checkout = end_date
      date_validation
    end

    def date_validation
      return true if @checkin < @checkout
      raise StandardError
    end

    def amount_days
      (@checkout - @checkin).to_i
    end

    def include?(date)
      return true if @checkin <= date && @checkout > date
      return false
    end

    # need to make a method to deal with overlapping

  end
end
