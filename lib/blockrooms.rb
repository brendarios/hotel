module Hotel
  class BlockRooms

    def initialize(checkin, checkout, rooms_set, rate)
      @price_per_night = rate
      @days_range = Hotel::DatesRange.new(checkin, checkout)
      @rooms_set = rooms_set
    end

    def available_room_in_block?

    end

    def reservation_block_room

        raise ArgumentError.new("Sorry, no more rooms available in the blocked rooms for this event")

    end

    def total_cost_block_room
      
    end

  end
end
