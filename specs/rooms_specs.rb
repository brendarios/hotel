  require_relative 'spec_helper'
require 'pry'

describe 'Rooms class' do
  before do
    @room = Hotel::Room.new(1, 200)
  end

  describe 'Initialize' do
    it "creates an instance" do
      @room.must_be_instance_of Hotel::Rooms
    end

    it "raises an error if the room number is not valid" do
      proc { room = Hotel::Room.new(30, 200) }.must_raise ArgumentError
    end

    it "responds to the room number" do
      @room.number.must_be_kind_of Integer
      @room.must_respond_to :number
    end

    it "access the status of the room" do
      @room.number.must_be_kind_of Symbol
      @room.must_equal :AVAILABLE
    end

  end

  describe "Available rooms in date range " do

    it "Returns list of available rooms if there are NO reservations" do

    end

    it "Returns empty array if no vacancies" do

    end

    it "Returns the right number of rooms available" do

    end

  end
end
