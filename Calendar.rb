# required classes
require 'date'
require_relative 'Event'
#implements the class Calendar
class Calendar
  attr_accessor :config, :days

  def initialize()
  @config=Hash.new {|hash, key| hash[key] = Hash.new {|h1,k1| h1[k1] = Hash.new {|h2,k2| h2[k2]=Array.new}}}
  @days = {
      "Sunday" => 0,
      "Monday" => 1,
      "Tuesday" => 2,
      "Wednesday" => 3,
      "Thursday" => 4,
      "Friday" => 5,
      "Saturday" => 6,
      'Sundary' => 7
  }
  end

  def add_event(date, event)
    d = Date._parse(date)
    @config[d[:year]][d[:mon]][d[:mday]] << event
  end

  def update_event(date, name)
    d = Date._parse(date)
    @config.dig(d[:year],d[:mon],d[:mday]).select{|event| event.name=name}.map{|x| x.print_Event}
    print 'Enter the ID of the event you want to update '
    id = gets.chomp
    print 'Enter the new name of the event '
    updated_name = gets.chomp
    print 'Enter the new venue of the event ' 
    updated_venue = gets.chomp
    print 'Enter the new date of the event '
    updated_date = gets.chomp
    updated_event = @config[d[:year]][d[:mon]][d[:mday]].find{|event| event.id=id}
    updated_event.name = updated_name
    updated_event.venue = updated_venue
    updated_event.name = updated_name
    updated_event.date = updated_date
    updated_event.print_Event
    
    end

  def delete_event(date,name)
    d=Date._parse(date)
    
    @config.dig(d[:year],d[:mon],d[:mday]).select { |event| event.name = name }.map { |x| x.print_Event }
    
    print "Enter the ID of the event you want to delete "
    id=gets.chomp
    @config.dig(d[:year],d[:mon],d[:mday]).reject! { |event| event.id == id.to_i }

    end

  def print_all_month_events(year, month)
    p @config
    @config.dig(year, month).each do |key, value|
      value.each do |event|
        event.print_Event
      end
    end
  end

  def print_all_day_events(year,month,day)
    p "All events on Day #{day} are"
    @config.dig(year,month,day).each do |value|
      value.print_Event
    end
  end

  def print_month(year, month)

    date = Date.new(year, month, 1)
    day = date.strftime('%A')
    start = @days[day]
    days = Date.new(year, month, -1).day
    i = 0
    j = 1
    puts("Sun\tMon\tTue\tWed\tThu\tFri\tSat")
    35.times do
    if i < start
      print("\t")
    elsif j >= days + 1
      break
    else
    print(j.to_s+"\t")
    j += 1
    end
    i += 1
    if i % 7 ==0
      puts("")
    end
  end
  puts("")
end

end