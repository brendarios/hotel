module Hotel

PRICE_PER_NIGHT = 200

  class Reservation
    attr_reader :checkin, :checkout, :range_of_dates, :room_number


    def initialize(checkin, checkout, room_number)
      @price_per_night = PRICE_PER_NIGHT
      @range_of_dates = Hotel::DatesRange.new(checkin, checkout)
      @room_number = room_number
    end

    def cost_reservation
      (@price_per_night * @range_of_dates.amount_days).to_f
    end

  end
end
