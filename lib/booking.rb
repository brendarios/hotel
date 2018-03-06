module Hotel
  class Booking # This class will control reservations

    attr_reader :reservations_list

    def initialize
      @reservations_list = []
    end

    def add_reservation(checkin, checkout)
      reservation_new = Hotel::Reservation.new(checkin, checkout)
      @reservations_list << reservation_new
    end

    def reservations_per_day(date)
      reservations_list_per_day = []
      @reservations_list.each do |reservation|
        if reservation.range_of_dates.include?(date)
          reservations_list_per_day << reservation
        end
      end
      return reservations_list_per_day
    end

  end #class
end #module
