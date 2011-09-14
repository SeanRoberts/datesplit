require 'date'
class Datesplit
  def initialize(date_string)
    @date_string = String.new(date_string)
  end

  def start_date
    expressions.each do |expression, returns|
      m = @date_string.match(expression)
      if m
        @start_date = Date.parse("#{m.captures[returns.index(:month_only) || returns.index(:month_one)]} #{m.captures[returns.index(:day_one)]} #{m.captures[returns.index(:year)]}") 
        break
      end
    end  
    raise "Can't process #{@date_string}" unless @start_date 
    return @start_date
  end
    
  def end_date
    expressions.each do |expression, returns|
      m = @date_string.match(expression)
      if m
        @end_date = Date.parse("#{m.captures[returns.index(:month_only) || returns.index(:month_two) ]} #{m.captures[returns.index(:day_two)]} #{m.captures[returns.index(:year)]}") 
        break
      end
    end
    raise "Can't process #{@date_string}" unless @end_date 
    return @end_date
  end
  
  def number_of_days
    (end_date - start_date).to_i
  end
  
  private 
    def expressions
      {
        /(\w+)\.*(?:\t|\s)*(\d+)\w*(?:\t|\s)*(?:\-|to)(?:\t|\s)*(\d+)\w*,*(?:\t|\s)*(\d*)/                    => [:month_only, :day_one, :day_two, :year], # September 13-15, 2011 (Year Optional)
        /(\w+)\.*(?:\t|\s)*(\d+)\w*(?:\t|\s)*(?:\-|to)(?:\t|\s)*(\w+)\.*(?:\t|\s)*(\d+)\w*,*(?:\t|\s)*(\d*)/  => [:month_one, :day_one, :month_two, :day_two, :year] # September 13 to October 15, 2011 (Year Optional)        
      }
    end
end