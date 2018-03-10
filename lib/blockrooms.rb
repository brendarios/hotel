module Hotel
  class BlockRooms

    def initialize(checkin, checkout, blocked_rooms, rate)
      @price_per_night = rate
      @days_range = Hotel::DatesRange.new(checkin, checkout)
      @blocked_rooms = blocked_rooms
    end

    def available_room_in_block?
      @blocked_rooms.length > 0 ? true : false
    end

    def reservation_block_room
      raise ArgumentError.new("Unavailable blocked rooms") if !available_room_in_block?
      @blocked_rooms.delete_at(0)
      return @blocked_rooms
    end

    def total_cost_block_room
      @price_per_night * @days_range.amount_days
    end

  end
end
