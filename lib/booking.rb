module Hotel

  Amount_Rooms_Hotel = 20
  Max_Block_Rooms = 5

  class Booking

    attr_reader :reservations_list, :rooms_list
    def initialize
      @reservations_list = []
      @rooms_list = {}
      setup_rooms

    end

    def setup_rooms
      Amount_Rooms_Hotel.times do |i|
        @rooms_list["#{i + 1}"] = []
      end
    end

    def is_available?(room_number, dates_to_reserve)
      available = true

      @rooms_list[room_number].each do |dates|
        if dates_to_reserve.overlap?(dates)
          available = false
        end
      end
      return available
    end

    def avaliable_rooms_daterange(checkin, checkout)
      list_availables = []
      date_range = Hotel::DatesRange.new(checkin,checkout)
      @rooms_list.each do |room_number, dates|
        if is_available?(room_number, date_range)
          list_availables  << room_number
        end
      end
      return list_availables
    end

    def add_reservation(checkin, checkout)
      dates_to_reserve = Hotel::DatesRange.new(checkin, checkout)
      @rooms_list.each do |room_number, dates|
        if  is_available?(room_number, dates_to_reserve)
          @rooms_list[room_number] << dates_to_reserve
          new_reservation = Hotel::Reservation.new(checkin, checkout, room_number)
          @reservations_list << new_reservation
          return new_reservation
        end
      end
      raise ArgumentError.new("Sorry!, No rooms available during that date range")
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


    def capacity_for_block_rooms?(checkin, checkout, num_rooms_to_block)
      raise ArgumentError.new('The maximum of rooms to block is 5') if num_rooms_to_block > Max_Block_Rooms
      return true if avaliable_rooms_daterange(checkin, checkout).length >= num_rooms_to_block
      return false
    end

  end
end
