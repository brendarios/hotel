require_relative 'spec_helper'
require 'pry'

describe 'BlockRooms class' do
  before do
    @start_date = Date.new(2018, 8, 20)
    @end_date = Date.new(2018, 8, 27)
    @blocked_rooms = [1,2,3,4]
    @discounted_rate = 130.50
    @new_block = Hotel::BlockRooms.new(@start_date, @end_date, @blocked_rooms, @discounted_rate)
  end

  describe 'Initialize' do
    it "Can be created" do
      @new_block.must_be_instance_of Hotel::BlockRooms
    end
  end

  describe "available_room_in_block? method" do

    it 'returns false if no rooms available in the blocked rooms set' do
      4.times do
        @new_block.reservation_block_room
      end
      @new_block.available_room_in_block?.must_equal false
    end

    it 'returns true if they are rooms available in the blocked rooms set' do
      @new_block.available_room_in_block?.must_equal true
    end
  end

  describe "reservation of block rooms method" do

    it "modifies blocked_rooms when a new reservation of a block room is created" do
      @new_block.reservation_block_room.must_equal [2, 3, 4]
      @new_block.reservation_block_room.must_equal [3,4]
      @new_block.reservation_block_room.must_be_kind_of Array
    end

    it 'raises an error if no more blocked rooms are available' do
      4.times do
        @new_block.reservation_block_room
      end
      proc{@new_block.reservation_block_room}.must_raise ArgumentError
    end
  end

  describe "total_cost_block_room method " do

    it 'Returns the total cost for reservation of a blocked room' do
      @new_block.total_cost_block_room.must_be_kind_of Float
      @new_block.total_cost_block_room.must_equal 913.50
    end

  end


end
