module Hotel

  class Reservation #This class will calculate the total cost for a given reservation.
    attr_reader :checkin, :checkout, :range_of_dates

    PRICE_PER_NIGHT = 200
    def initialize(checkin, checkout)
      @price_per_night = PRICE_PER_NIGHT
      @range_of_dates = Hotel::DatesRange.new(checkin, checkout)
    end

    def cost_reservation
      @price_per_night * @range_of_dates.amount_days
    end

  end #class
end #module
