Datesplit
=========

Datesplit is a gem for converting date duration strings such as "August 14th to September 21st, 2012" into date objects.  It piggybacks heavily off of Date#parse.


Usage
-----

Datesplit has only 3 public methods: start_date, end_date, and duration.  Each does pretty much what you would expect.

    dates = Datesplit.new('April 9th to April 20th, 2012')
    dates.range                    # Returns a range of Date objects from April 9th..April 20th
    dates.start_date               # Returns #<Date: 4912053/2,0,2299161>
    dates.end_date                 # Returns #<Date: 4912075/2,0,2299161>
    dates.number_of_days           # Returns 11

    dates.each { |d| puts d }      # Steps through each date in the range between April 9th and 20th (inclusive)

Formats
-----

A list of formats that Datesplit undestands can be found in the spec/datesplit_spec.rb.  This list is small but growing.
