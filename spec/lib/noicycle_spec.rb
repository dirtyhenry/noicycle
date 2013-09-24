require 'spec_helper'

describe Noicycle do
  it "returns a hash with as many results as requested when the reference date is old enough" do 
    noicycle = Noicycle::Noicycle.new
    ref_date = Date.parse("5th May 2013")
    for i in 3..5
      tapes = noicycle.tapes(ref_date, i)
      tapes.size.should eq(i)
    end
  end

  it "returns the right result for a given example DAILY" do 
    noicycle = Noicycle::Noicycle.new
    ref_date = Date.parse("5th May 2013")
    cur_date = Date.parse("24th September 2013")
    tapes = noicycle.tapes(ref_date, 7, cur_date)

    tapes.size.should eq(7)
    tapes[1].should == Date.parse("23rd September 2013")
    tapes[2].should == Date.parse("24th September 2013")
    tapes[3].should == Date.parse("22nd September 2013")
    tapes[4].should == Date.parse("18th September 2013")
    tapes[5].should == Date.parse("25th August 2013")
    tapes[6].should == Date.parse("9th August 2013")
    tapes[7].should == Date.parse("10th September 2013")
  end

  it "returns the right result for a given example WEEKLY" do 
    noicycle = Noicycle::Noicycle.new
    ref_date = Date.parse("5th May 2013")
    cur_date = Date.parse("24th September 2013")
    tapes = noicycle.tapes(ref_date, 7, cur_date, true)

    tapes.size.should eq(6)
    tapes[1].should == Date.parse("15th September 2013")
    tapes[2].should == Date.parse("8th September 2013")
    tapes[3].should == Date.parse("22nd September 2013")
    tapes[4].should == Date.parse("30th June 2013")
    tapes[5].should == Date.parse("25th August 2013")
    tapes[6].should == nil
    tapes[7].should == Date.parse("5th May 2013")
  end
end