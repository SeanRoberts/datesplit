require 'spec_helper'

describe Datesplit do
  it "handles a format of '<Month> <Day> to <Month> <Day>, <Year>'" do
    d = Datesplit.new('April 11 to April 20, 2012')
    d.start_date.to_s.should == Date.parse('April 11, 2012').to_s
    d.end_date.to_s.should == Date.parse('April 20, 2012').to_s
  end

  it "handles a format of '<Month> <Day> to <Month> <Day>'" do
    d = Datesplit.new('April 11 to April 20')
    d.start_date.to_s.should == Date.parse('April 11').to_s
    d.end_date.to_s.should == Date.parse('April 20').to_s
  end

  it "handles a format of '<Month> <Day>-<Day> <Year>'" do
    d = Datesplit.new('April 11th-20th 2012')
    d.start_date.to_s.should == Date.parse('April 11 2012').to_s
    d.end_date.to_s.should == Date.parse('April 20 2012').to_s
  end

  it "handles a format of '<Month> <Day>-<Day>'" do
    d = Datesplit.new('April 11th-20th')
    d.start_date.to_s.should == Date.parse('April 11').to_s
    d.end_date.to_s.should == Date.parse('April 20').to_s
  end

  it "handles a format of '<Month> <Day> to <Day> <Year>'" do
    d = Datesplit.new('April 11 to 20 2012')
    d.start_date.to_s.should == Date.parse('April 11 2012').to_s
    d.end_date.to_s.should == Date.parse('April 20 2012').to_s
  end

  it "handles a format of '<Month> <Day>-<Month> <Day>, <Year>'" do
    d = Datesplit.new('March 30-April 1, 2012')
    d.start_date.to_s.should == Date.parse('March 30 2012').to_s
    d.end_date.to_s.should == Date.parse('April 1 2012').to_s
  end

  it "handles a format of '<Month> <Day>, <Year> to <Month> <Day> <Year>'" do
    d = Datesplit.new('April 9, 2012 to January 1st 2013')
    d.start_date.to_s.should == Date.parse('April 9 2012').to_s
    d.end_date.to_s.should == Date.parse('January 1 2013').to_s
  end

  it "raises a ParseError given an unknown format" do
    d = Datesplit.new('garbage data')
    expect { d.start_date }.to raise_error(Datesplit::ParseError)
    expect { d.end_date }.to raise_error(Datesplit::ParseError)
  end
end
