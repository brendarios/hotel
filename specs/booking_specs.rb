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

    it "Create list of Reservation" do
      @booking.list_reservations.must_equal []
    end
  end

  describe "add_reservation method " do
    before do
      @start_date = Date.new(2018, 8, 20)
      @end_date = Date.new(2018, 8, 27)
    end

    it "Creates an array of reservation" do
      @booking.add_reservation(@start_date,@end_date).must_be_instance_of Array
    end

    it "Each element in the array is a Reservation" do
      @booking.add_reservation(@start_date,@end_date)[0].must_be_instance_of Hotel::Reservation
    end
  end

  describe "reservations_per_day method" do
    before do
      @date1 = Date.new(2018,02,20)
      @date2 = Date.new(2018,03,23)
      @date3 = Date.new(2018,03,31)
      @date4 = Date.new(2018,04,04)
      @date5 = Date.new(2018,04,29)
      @booking = Hotel::Booking.new
      @booking.add_reservation(@date1, @date3)
      @booking.add_reservation(@date1, @date4)


    end

    it 'Returns an array of reservations instances' do
      @booking.reservations_per_day(@date1)[0].must_be_instance_of Hotel::Reservation
    end

    it 'Returns an array of reservations of the specific date ' do
      @booking.reservations_per_day(@date1).must_be_instance_of Array
    end

    it 'Returns empty array if that day there is no reservations' do
      @booking.reservations_per_day(@date2).must_equal []
    end

    it 'Returns all the reservations per day, when is not empty' do
      @booking.reservations_per_day(@date1).length.must_equal 2
    end

  end
end
