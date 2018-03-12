require_relative 'spec_helper'

describe 'DatesRange class' do

  describe 'initialize method' do
    before do
      @checkin = Date.new(2018,6,4)
      @checkout = Date.new(2018,6,7)
      @date_new = Hotel::DatesRange.new(@checkin ,@checkout)
    end

    it "responds to checkin" do
      @date_new.checkin.must_equal @checkin
    end

    it "responds to checkout" do
      @date_new.checkout.must_equal @checkout
    end

    it "can be initialize if the dates are valid" do
      Hotel::DatesRange.new(@checkin, @checkout).must_be_instance_of Hotel::DatesRange
    end

    it "raises an error if checkin and checkout are the same day" do
      # checkin overlap with checkout when both are the same day.
      proc{Hotel::DatesRange.new(@checkin, @checkin)}.must_raise ArgumentError
    end

    it "raises error if checkin is after checkout" do
      proc {Hotel::DatesRange.new(@checkout, @checkin)}.must_raise ArgumentError
    end

    it "raises error if checkout is before checkin" do
      proc {Hotel::DatesRange.new(@checkout, @checkin)}.must_raise StandardError
    end

  end


  describe "amount_days method" do
    before do
      @checkin = Date.new(2018,2,5)
      @checkout = Date.new(2018,2,7)
      @date_new = Hotel::DatesRange.new(@checkin ,@checkout)
    end

    it "returns the correct amount of days" do
      @date_new.amount_days.must_be_kind_of Integer
      @date_new.amount_days.must_equal 2
    end

  end

  describe 'include? method' do
    before do
      @checkin = Date.new(2018,2,5)
      @checkout = Date.new(2018,2,8)
      @date_new = Hotel::DatesRange.new(@checkin, @checkout)
    end

    it 'returns true if the date is included' do
      date = Date.new(2018,2,6)
      @date_new.include?(date).must_equal true
    end

    it 'returns false for a date that is out of the range' do
      date = Date.new(2018,2,9)
      @date_new.include?(date).must_equal false
    end

    it 'returns false if the date is the checkout date' do
      @date_new.include?(@checkout).must_equal false
    end

    it 'returns true if the date is the checkin date' do
      @date_new.include?(@checkin).must_equal true
    end

  end

  describe 'overlap?' do
    before do
      @day1 = Date.new(2018,10,14)
      @day2 = Date.new(2018,10,20)
      @day3 = Date.new(2018,10,8)
      @day4 = Date.new(2018,10,13)
      @day5 = Date.new(2018,10,25)
      @day6 = Date.new(2018,10,15)
      @day7 = Date.new(2018,10,17)
      @daterange1 = Hotel::DatesRange.new(@day1,@day2)
      @daterange2 = Hotel::DatesRange.new(@day3,@day4)
      @daterange3 = Hotel::DatesRange.new(@day2,@day5)
      @daterange4 = Hotel::DatesRange.new(@day6,@day7)
      @daterange5 = Hotel::DatesRange.new(@day6,@day5)
      @daterange6 = Hotel::DatesRange.new(@day3,@day5)
      @daterange7 = Hotel::DatesRange.new(@day3,@day6)
      @daterange8 = Hotel::DatesRange.new(@day3,@day2)
      @daterange9 = Hotel::DatesRange.new(@day1,@day7)
  end

    it "returns false if the date range don't overlap" do
      # daterange1 completely after daterange2
      @daterange1.overlap?(@daterange2).must_equal false

      # daterange1 completely before daterange3
      # daterange1 ends on the checkin date of daterange3
      @daterange1.overlap?(@daterange3).must_equal false

    end

    it "returns true if the dates ranges overlap" do
      # daterange1 is completely containing daterange4
      @daterange1.overlap?(@daterange4).must_equal true

      # daterange8 is completely containing daterange9
      @daterange8.overlap?(@daterange9).must_equal true

      # daterange1 completely contained in daterange6
      @daterange1.overlap?(@daterange6).must_equal true

      # daterange5 overlaps in the front with daterange1
      @daterange5.overlap?(@daterange1).must_equal true

      # daterange7 overlaps in the back with daterange1
      @daterange7.overlap?(@daterange1).must_equal true
    end
  end

end
