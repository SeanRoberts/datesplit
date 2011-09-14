require 'spec_helper'

describe Datesplit do
  it "should return dates for 'April 11 to April 20, 2012'" do
    d = Datesplit.new('April 11 to April 20, 2012')
    d.start_date.to_s.should == Date.parse('April 11, 2012').to_s
    d.end_date.to_s.should == Date.parse('April 20, 2012').to_s
  end
  
  it "should return dates for 'April 11 to April 20'" do
    d = Datesplit.new('April 11 to April 20')
    d.start_date.to_s.should == Date.parse('April 11').to_s
    d.end_date.to_s.should == Date.parse('April 20').to_s
  end
  
  it "should return dates for 'April 11th-20th 2012'" do
    d = Datesplit.new('April 11th-20th 2012')
    d.start_date.to_s.should == Date.parse('April 11 2012').to_s
    d.end_date.to_s.should == Date.parse('April 20 2012').to_s
  end
  
  it "should return dates for 'April 11 to 20 2012'" do
    d = Datesplit.new('April 11 to 20 2012')
    d.start_date.to_s.should == Date.parse('April 11 2012').to_s
    d.end_date.to_s.should == Date.parse('April 20 2012').to_s
  end
  
  
  it "should return dates for 'March 30-April 1, 2012'" do
    d = Datesplit.new('March 30-April 1, 2012')
    d.start_date.to_s.should == Date.parse('March 30 2012').to_s
    d.end_date.to_s.should == Date.parse('April 1 2012').to_s
  end
  
  it "should return dates for 'Apr 27  to April 29, 2012'" do
    d = Datesplit.new('Apr 27  to April 29, 2012')
    d.start_date.to_s.should == Date.parse('Apr 27 2012').to_s
    d.end_date.to_s.should == Date.parse('April 29, 2012').to_s
  end
end
