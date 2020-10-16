require 'date'
require_relative 'file_manager'
require_relative 'event'

class EventManager
  attr_reader :events

  def initialize
    @events = []
    FileManager.list_all.each do |event_file_name|
      @events.push(read(event_file_name))
    end
    @events.sort_by!(&:date)
  end

  def run_command(command, parameters)
    case command
    when 'add' then add(*parameters)
    when 'delete'  then delete(*parameters)
    when 'display' then display(*parameters)
    when 'display-all' then display_all
    when 'display-on' then display_on(*parameters)
    when 'display-before' then display_before(*parameters)
    when 'display-after' then display_after(*parameters)
    when 'display-between' then display_between(*parameters)
    when 'find-all-overlapping' then find_all_overlapping
    when 'find-overlapping' then find_overlapping_for(*parameters)
    when 'count' then puts @events.count
    when 'reset' then FileManager.reset
    else display_usage
    end
  end

  def add(name, date, start_time, end_time)
    event = Event.new(name, date, start_time, end_time)
    FileManager.write(name, event.string_representation)
    puts %(Event "#{name}" added)
    find_overlapping_for(event)
  end

  def read(name)
    string_representation = FileManager.read(name)
    Event.new_from_string_representation(string_representation)
  end

  def select(name)
    @events.select { |event| event.name == name }[0]
  end

  def display(name)
    select(name).display
  end

  def delete(name)
    FileManager.delete(name)
    puts %(Event "#{name}" deleted)
  end

  def diplay_multiple(events)
    events.each(&:display)
  end

  def display_all
    diplay_multiple(@events)
  end

  def display_on(date)
    events = @events.select { |event| event.date == Date.parse(date) }
    diplay_multiple(events)
  end

  def display_before(date)
    events = @events.select { |event| event.date < Date.parse(date) }
    diplay_multiple(events)
  end

  def display_after(date)
    events = @events.select { |event| event.date > Date.parse(date) }
    diplay_multiple(events)
  end

  def display_between(start_date, end_date)
    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)
    raise 'Date range specified in incorrect order' unless start_date < end_date

    events = @events.select { |event| event.date > start_date && event.date < end_date }
    diplay_multiple(events)
  end

  def display_overlapping_warning(event1, event2)
    puts %(Warning: "#{event1.name}" overlaps with "#{event2.name}")
    event1.display
    event2.display
  end

  def find_overlapping_for(event1_name)
    event1 = select(event1_name)
    @events.each do |event2|
      next if event1.equal? event2

      display_overlapping_warning(event1, event2) if event1.overlaps? event2
    end
  end

  def find_all_overlapping
    (0...@events.size).each do |i|
      (i + 1...@events.size).each do |j|
        display_overlapping_warning(@events[i], @events[j]) if @events[i].overlaps? @events[j]
      end
    end
  end

  def display_usage
    print <<~HELP
      Available commands:
      
      add <name> <date> <start time> <end time>
      eg. add 'Meet mom' 23.10.2020 10:00am 11:00am
  
      display <name>
      eg. display 'Meet mom'
  
      delete <name>
      eg. delete 'Meet mom'
    
      display-all
  
      display-on <date>
      eg. display-on 23.10.2020

      display-before <date>
      eg. display-before 23.10.2020

      display-after <date>
      eg. display-after 23.10.2020

      display-between <date 1> <date 2>
      eg. display-between 22.9.2020 23.10.2020

      find-all-overlapping

      find-overlapping <event>
      eg. find-overlapping 'Meet mom'

      count
  
      reset
    HELP
  end
end

if __FILE__ == $PROGRAM_NAME
  event_manager = EventManager.new
  event_manager.run_command(ARGV[0], ARGV[1..-1])
end
