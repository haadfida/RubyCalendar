require 'date'
require_relative 'Event'
require_relative 'Calendar'


calendar = Calendar.new()


puts('Welcome to Ruby Calendar')
puts('Press A- to ADD EVENT')
puts('Press B- to DELETE EVENT')
puts('Press C- to UPDATE EVENT')
puts('Press D- to SHOW ALL EVENTS IN A MONTH')
puts('Press E- to SHOW ALL EVENTS IN A DAY')
puts('Press F- to SHOW MONTHLY VIEW')
input = gets.chomp
case input
when 'A'
  puts('Enter event name')
  name = gets.chomp
  puts('Enter event venue')
  venue = gets.chomp
  puts('Enter event date')
  date = gets.chomp
  if date =~ /\d{4}-\d{1,2}-\d{1,2}$/
  puts('Enter timestamp')
  timestamp = gets.chomp
  event = Event.new(name, venue, date, timestamp)
  calendar.add_event(date, event)
  p event
  else
    puts('Incorrect Date input, YYYY-MM-DD in Numeric format')
  end
when 'B'
  puts('Enter event date')
  date = gets.chomp
  if date =~ /\d{4}-\d{1,2}-\d{1,2}$/
    puts('Enter name')
    name = gets.chomp
    calendar.update_event(date, name)
    p event
  else
    puts('Incorrect Date input, YYYY-MM-DD in Numeric format')
  end
when 'C'
	puts('Enter event date')
  date = gets.chomp
  if date =~ /\d{4}-\d{1,2}-\d{1,2}$/
    puts('Enter name')
    name = gets.chomp
    calendar.delete_event(date, name)
    p event
  else
    puts('Incorrect Date input, YYYY-MM-DD in Numeric format')
  end
when 'D'
  puts('Enter year')
  year = gets.chomp
  puts('Enter month')
  month = gets.chomp
  calendar.print_all_month_events(year,month)
  
when 'E'
  puts('Enter year')
  year = gets.chomp
  puts('Enter month')
  month = gets.chomp
  puts('Enter day')
  day = gets.chomp
  calendar.print_all_day_events(year.to_i,month.to_i,day.to_i)

when 'F'
	puts('Enter year')
  year = gets.chomp
  puts('Enter month')
  month = gets.chomp
	calendar.print_month(year.to_i,month.to_i)
end

#calendar.add_event("2013/11/2",event1)

#calendar.update_event("2013/11/2","Eid")

#calendar.delete_event("2013/11/2","Eid")

#calendar.print_month(2021,9)
#calendar.print_All_MonthEvents(2013,11)
#calendar.print_All_Day_Events(2013,11,2)