module Hotel

  AMOUNT_ROOMS_HOTEL = 20
  MAX_BLOCKED_ROOMS = 5

  class Booking

    attr_reader :rooms_list, :reservations_list
    def initialize
      @reservations_list = []
      @rooms_list = {}
      setup_rooms

    end

    def setup_rooms
      AMOUNT_ROOMS_HOTEL.times do |num|
        @rooms_list["#{num + 1}"] = []
      end
    end

    def is_available?(room_number, dates_to_reserve)
      is_available = true

      @rooms_list[room_number].each do |dates|
        if dates_to_reserve.overlap?(dates)
          is_available = false
        end
      end
      return is_available
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
      raise ArgumentError.new('The maximum of rooms to block is 5') if num_rooms_to_block > MAX_BLOCKED_ROOMS
      return true if avaliable_rooms_daterange(checkin, checkout).length >= num_rooms_to_block
      return false
    end

    def building_block_rooms(checkin, checkout, num_rooms_to_block, discounted_rate)
      array_rooms_blocked = []
      if capacity_for_block_rooms?(checkin, checkout, num_rooms_to_block)
        num_rooms_to_block.times do
          reservation_block_room = add_reservation(checkin, checkout)
          array_rooms_blocked << reservation_block_room.room_number
        end
      end
     return Hotel::BlockRooms.new(checkin, checkout, num_rooms_to_block, discounted_rate)
    end
  end
end
