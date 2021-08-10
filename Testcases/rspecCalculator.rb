require 'rspec/autorun'
require_relative 'Calendar'

describe Calendar do
  it "adds an event" do
  calendar=Calendar.new
  event = Event.new("Battle of the Bands", "Downtown", "2021-09-02", "16:00")
  calendar.add_event("2021-09-02", event)
  puts('Test Case 1')
  p(Calendar)
  puts('Test Case Ended')
  end
  it "updates an event" do
    puts('Test Case 2')
    calendar=Calendar.new
    event = Event.new("Battle of the Bands", "Downtown", "2021-09-02", "16:00")
    calendar.add_event("2021-09-02", event)
    calendar.update_event("2021-09-02","Battle of the Bands")		
  p(Calendar)
  puts('Test Case Ended')
  end
  it "deletes an event" do
  puts('Test Case 3')
  calendar = Calendar.new
	event = Event.new("Battle of the Bands", "Downtown", "2021-09-02", "16:00")
  calendar.add_event("2021-09-02", event)
  event1 = Event.new("Battle of the Bands", "Jersey", "2021-09-05", "12:00")
  calendar.add_event("2021-09-02", event1)

  calendar.delete_event("2021-09-02","Battle Of the Bands") 		
  p(calendar)
  puts('Test Case Ended')
  end
  it "prints all events in a month" do
  puts('Test Case 4')
  calendar=Calendar.new
  event = Event.new("Battle of the Bands", "Downtown", "2021-09-02", "16:00")
  calendar.add_event("2021-09-09", event)
  event1 = Event.new("Battle of the Bands", "Jersey", "2021-09-05", "12:00")
  calendar.add_event("2021-09-06", event1)
  event2 = Event.new("Battle of the Bands", "Jersey", "2021-09-05", "13:00")
  calendar.add_event("2021-09-05", event2)
  calendar.print_all_month_events(2021,9)
  puts('Test Case Ended')
  	end
  	it "it prints all events in a day" do
  puts('Test Case 4')
  calendar=Calendar.new
  event = Event.new("Battle of the Bands", "Downtown", "2021-09-02", "16:00")
  calendar.add_event("2021-09-10", event)
  event1 = Event.new("Battle of the Bands", "Jersey", "2021-09-05", "12:00")
  calendar.add_event("2021-09-10", event1)
  event2 = Event.new("Battle of the Bands", "Jersey", "2021-09-05", "13:00")
  calendar.add_event("2021-09-10", event2)
  expect(calendar.print_all_day_events(2021,9,10)).to eq([event,event1,event2])
  puts('Test Case Ended')
  end
end