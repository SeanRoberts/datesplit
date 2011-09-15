require 'date'
class Datesplit
  include Enumerable
  ParseError = Class.new(StandardError)
  
  def initialize(date_string)
    @date_string = String.new(date_string)
  end

  def start_date
    range.begin
  end
    
  def end_date
    range.end
  end
  
  def range
    return if @range
    expressions.each do |expression, returns|
      m = @date_string.match(expression)
      if m
        @start = Date.parse("#{m.captures[returns.index(:month_only) || returns.index(:month_one)]} #{m.captures[returns.index(:day_one)]} #{m.captures[returns.index(:year_only) || returns.index(:year_one)]}")
        @end = Date.parse("#{m.captures[returns.index(:month_only) || returns.index(:month_two) ]} #{m.captures[returns.index(:day_two)]} #{m.captures[returns.index(:year_only) || returns.index(:year_two)]}") 
        break
      end
    end
    raise ParseError, "Can't process #{@date_string}" unless @start && @end
    @start..@end
  end 
    
  def number_of_days
    range.to_a.size
  end
  
  def each(&blk)
    range.each(&blk)
  end
    
  private 
    def expressions
      {
        /(\w+)\.*(?:\t|\s)*(\d+)\w*(?:\t|\s)*(?:\-|to)(?:\t|\s)*(\d+)\w*,*(?:\t|\s)*(\d*)/                                            => [:month_only, :day_one, :day_two, :year_only], # September 13-15, 2011 (Year Optional)
        /(\w+)\.*(?:\t|\s)*(\d+)\w*(?:\t|\s)*(?:\-|to)(?:\t|\s)*(\w+)\.*(?:\t|\s)*(\d+)\w*,*(?:\t|\s)*(\d*)/                          => [:month_one, :day_one, :month_two, :day_two, :year_only], # September 13 to October 15, 2011 (Year Optional)        
        /(\w+)\.*(?:\t|\s)*(\d{1,2})\w*,*(?:\t|\s)*(\d{4})(?:\t|\s)*(?:\-|to)(?:\t|\s)*(\w+)\.*(?:\t|\s)*(\d+)\w*,*(?:\t|\s)*(\d{4})/ => [:month_one, :day_one, :year_one, :month_two, :day_two, :year_two] # September 13, 2012 to October 15 2013 (Year Required)
      }
    end
end