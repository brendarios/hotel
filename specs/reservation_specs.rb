require_relative 'spec_helper'
require 'pry'

describe 'Reservation class' do
  before do
    @start_date = Date.new(2018, 8, 20)
    @end_date = Date.new(2018, 8, 27)
    @room_number = 5
    @reservation_new = Hotel::Reservation.new(@start_date, @end_date, @room_number)
  end

  describe 'Initialize method' do
    it "can be created" do
      @reservation_new.must_be_instance_of Hotel::Reservation
    end

    it "does not initialize incorrect dates like using the checkin date for checkout also" do
      proc{Hotel::Reservation.new(@start_date, @start_date, @room_number)}.must_raise ArgumentError
    end

    it "does not initialize incorrect dates like using the checkout date for checkin also" do
      proc{Hotel::Reservation.new(@end_date, @end_date, @room_number)}.must_raise ArgumentError
    end
  end

  describe "cost_reservation method " do

    it "returns the cost of a reservation" do
        @reservation_new.cost_reservation.must_equal 1400
        @reservation_new.cost_reservation.must_be_kind_of Float
    end
  end
end
