require_relative 'spec_helper'
require 'pry'

describe 'Booking class' do
  before do
    @booking = Hotel::Booking.new
  end

  describe 'Initialize' do
    it "Can be create" do
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
end
