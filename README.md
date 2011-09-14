Datesplit
=========

Datesplit is a gem for converting date duration strings such as "August 14th to September 21st, 2012" into date objects.  It piggybacks heavily off of Date#parse.


Usage
-----

Datesplit has only 3 public methods: start_date, end_date, and duration.  Each does pretty much what you would expect.

    dates = Datesplit.new('April 9th to April 20th, 2012')
    dates.start_date.to_s    # Returns #<Date: 4912053/2,0,2299161>
    dates.end_date.to_s      # Returns #<Date: 4912075/2,0,2299161>
    dates.duration           # Returns 11


Formats
-----

A list of formats that Datesplit undestands can be found in the spec/datesplit_spec.rb.  This list is small but growing.