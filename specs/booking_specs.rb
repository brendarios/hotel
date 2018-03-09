require_relative 'spec_helper'
require 'pry'

describe 'Booking class' do
  before do
    @booking = Hotel::Booking.new
  end

  describe 'Initialize' do
    it "Can be created" do
      @booking.must_be_instance_of Hotel::Booking
    end

    it "Creates a list of Reservations" do
      @booking.reservations_list.must_equal []
      @booking.must_respond_to :reservations_list
    end

    it "has a collection of 20 rooms" do
      @booking.rooms_list.length.must_equal 20
    end

    it "Creates a collection of rooms in a hash" do
      @booking.rooms_list.must_be_instance_of Hash
    end
  end

  describe "add_reservation method " do
    before do
      @start_date = Date.new(2018, 8, 20)
      @end_date = Date.new(2018, 8, 27)
    end

    it "Creates a new reservation" do
      day1 = Date.new(2018,11,8)
      day2 = Date.new(2018,11,13)
      day3 = Date.new(2018,11,25)
      day4 = Date.new(2018,11,27)
      day5 = Date.new(2018,11,30)
      day6 = Date.new(2018,12,4)
      day7 = Date.new(2018,12,7)
      @booking.add_reservation(day1,day2)
      @booking.add_reservation(day3,day4)
      @booking.add_reservation(day4,day5)
      @booking.add_reservation(day5,day6)
      @booking.add_reservation(day6,day7)
      @booking.reservations_list.length.must_equal 5
      @booking.reservations_list.must_be_instance_of Array
      @booking.add_reservation(@start_date,@end_date).must_be_instance_of Hotel::Reservation
    end


    it "Creates an instance of reservation for a date range" do
      new_reservation = @booking.add_reservation(@start_date,@end_date)
      new_reservation.must_be_instance_of Hotel::Reservation
    end

    it 'does not create a reservation if no rooms are available' do
      day1 = Date.new(2018,11,8)
      day2 = Date.new(2018,11,13)
      20.times do
        @booking.add_reservation(day1,day2)
      end
      proc{@booking.add_reservation(day1,day2)}.must_raise ArgumentError
    end

    it 'changes the hash of rooms' do
      day1 = Date.new(2018,11,8)
      day2 = Date.new(2018,11,13)
      day3 = Date.new(2018,11,25)
      day4 = Date.new(2018,11,27)
      day5 = Date.new(2018,11,30)
      @booking.add_reservation(day1,day2)
      @booking.add_reservation(day3,day4)
      @booking.add_reservation(day4,day5)
      @booking.rooms_list["1"].length.must_equal 3
      @booking.add_reservation(day4,day5)
      @booking.rooms_list["2"].length.must_equal 1
      @booking.rooms_list["3"].length.must_equal 0
    end

  end
end


describe "reservations_per_day method" do
  before do
    @date1 = Date.new(2018,02,20)
    @date2 = Date.new(2018,02,24)
    @date3 = Date.new(2018,03,31)
    @date4 = Date.new(2018,04,04)
    @date5 = Date.new(2018,04,29)
    @date6 = Date.new(2018,05,02)
    @date6 = Date.new(2018,05,10)
    @booking = Hotel::Booking.new
    @booking.add_reservation(@date1, @date2)
    @booking.add_reservation(@date1, @date3)
    @booking.add_reservation(@date2, @date3)
    @booking.add_reservation(@date4, @date5)
    @booking.add_reservation(@date5, @date6)
  end

  it 'Returns an array of reservations instances' do
    @booking.reservations_per_day(@date1)[0].must_be_instance_of Hotel::Reservation
  end

  it 'Returns an array of reservations of the specific date ' do
    @booking.reservations_per_day(@date1).must_be_instance_of Array
  end

  it 'Returns empty array if that day there is no reservations' do
    @booking.reservations_per_day(@date6).must_equal []
  end

  it 'Returns all the reservations per day, when is not empty' do
    @booking.reservations_per_day(@date1).length.must_equal 2
  end

  describe 'avaliable_rooms_daterange method' do
    before do
      @day1 = Date.new(2018,12,13)
      @day2 = Date.new(2018,12,19)
      @day3 = Date.new(2018,12,07)
      @day4 = Date.new(2018,12,12)
      @day5 = Date.new(2018,12,24)
      @day6 = Date.new(2018,12,14)
      @day7 = Date.new(2018,12,16)
      @all_rooms = []
      20.times do |i|
        @all_rooms << "#{i+1}"
      end
    end

    it "returns all the  rooms if there is 0 reservations for that date range" do
      @booking.avaliable_rooms_daterange(@day1, @day2).must_equal @all_rooms
    end

    it "returns the rooms avaliables" do
      3.times do
        @booking.add_reservation(@day1, @day2)
      end
      @booking.add_reservation(@day3,@day4)
      @booking.add_reservation(@day1,@day5)
      @booking.avaliable_rooms_daterange(@day6,@day7).must_equal @all_rooms[4..19]
    end

  end
end
