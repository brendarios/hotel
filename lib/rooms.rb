module Hotel
  
PRICE_PER_NIGHT = 200

  class Rooms

    attr_accessor :room_status
    attr_reader :number

    def initialize(number, rate)
      return raise ArgumentError.new("That room number is not valid") if !(1..20).include?(number)
      @room_status = :AVAILABLE
      @number = number
      @rate = PRICE_PER_NIGHT
    end


  end
end
