require_relative 'spec_helper'
require 'pry'

describe 'BlockRooms class' do
  before do

  end

  describe 'Initialize' do
    it "Can be created" do

    end

  end

  describe "total_cost method " do

    it 'Returns the total cost for reservation of a blocked room' do

    end

  end

  describe "available_room_in_block? method" do

    it 'returns false if no rooms available in the blocked rooms set' do

    end

    it 'returns true if they are rooms available in the blocked rooms set' do

    end
  end

  describe "reservation of block rooms method" do

    it "modifies the rooms_set when a new reservation is created" do

    end

    it 'raises an error if no more blocked rooms are available' do

      proc{}.must_raise ArgumentError
    end
  end

end
