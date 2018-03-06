require_relative 'spec_helper'
require 'pry'

describe 'Reservation class' do
  before do
    @start_date = Date.new(2018, 8, 20)
    @end_date = Date.new(2018, 8, 27)
    @reservation_new = Hotel::Reservation.new(@start_date, @end_date)
  end

  describe 'Initialize' do
    it "Can be created" do
      @reservation_new.must_be_instance_of Hotel::Reservation
    end

  end

  describe "cost_reservation method " do

    it "Returns the cost of a reservation" do
        @reservation_new.cost_reservation.must_equal 1400
    end

  end
end
