# see: http://api.rubyonrails.org/classes/DateTime.html#method-i-to_formatted_s
Time::DATE_FORMATS[:month_and_year] = '%B %Y'
Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }
Time::DATE_FORMATS[:dow_with_long] = '%a, %e %b %Y %H:%M %Z'
