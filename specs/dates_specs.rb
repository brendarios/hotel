require_relative 'spec_helper'

describe 'DatesRange class' do
  describe 'initialize' do
    before do
      @start_date = Date.new(2018,6,4)
      @end_date = Date.new(2018,6,7)
    end

    it "responds to checkin" do
      date_new = Hotel::DatesRange.new(@start_date ,@end_date)
      date_new.checkin.must_equal @start_date
    end

    it "responds to checkout" do
      date_new = Hotel::DatesRange.new(@start_date ,@end_date)
      date_new.checkout.must_equal @end_date
    end

    it "can be initialize if the dates are valid" do
      Hotel::DatesRange.new( @start_date, @end_date).must_be_instance_of Hotel::DatesRange
    end

    it "Raises an error if checkin and checkout are the same day" do
      proc{Hotel::DatesRange.new(@start_date, @start_date)}.must_raise StandardError
    end

    it "Raises error if checkin is after checkout" do
      proc {Hotel::DatesRange.new(@end_date, @start_date)}.must_raise StandardError
    end

    it "Raises error if checkout is before checkin" do
      proc {Hotel::DatesRange.new(@end_date, @start_date)}.must_raise StandardError
    end

  end # describe initialize


  describe "amount_days method" do
    before do
      @start_date = Date.new(2018,2,5)
      @end_date = Date.new(2018,2,7)
    end

    it "Returns an integer as result of the amount of days" do
      date_new = Hotel::DatesRange.new(@start_date, @end_date)
      date_new.amount_days.must_be_kind_of Integer
    end

    it "Returns the correct amount of days" do
      date_new = Hotel::DatesRange.new(@start_date, @end_date)
      date_new.amount_days.must_equal 2
    end

  end # describe amount_days method

  describe 'include? method' do
    before do
      @checkin = Date.new(2018,2,5)
      @checkout = Date.new(2018,2,8)
      @datenewrange = Hotel::DatesRange.new(@checkin, @checkout)
    end

    it 'returns true if the date is included' do
      date = Date.new(2018,2,6)
      @datenewrange.include?(date).must_equal true
    end

    it 'returns false for a date that is out of the range' do
      date = Date.new(2018,2,9)
      @datenewrange.include?(date).must_equal false
    end

    it 'returns false if the date is the checkout date' do
      @datenewrange.include?(@checkout).must_equal false
    end

    it 'returns true if the date is the checkin date' do
      @datenewrange.include?(@checkin).must_equal true
    end

  end

  describe 'overlap?' do
    before do
  end

    it "returns true if the checkin is the same day as the checkout day" do

    end

    it "returns false if the date range don't overlap" do

    end

    it "returns true if the dates ranges overlap" do
    
    end
  end#overlap

end
