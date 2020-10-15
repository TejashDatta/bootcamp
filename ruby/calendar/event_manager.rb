require 'date'
require_relative 'file_manager'
require_relative 'event'

# 複数のイベントを管理するオブジェクト
class EventsManager
  attr_reader :events

  def initialize
    @events = []
    FileManager.list_all.each do |event_file_name|
      @events.push(Event.new_from_file(event_file_name))
    end
    @events.sort_by!(&:date)
  end

  def display_events(events)
    events.each(&:display)
  end

  def display_all
    display_events(@events)
  end

  def display_for_date(date)
    events_for_date = @events.select { |event| event.date == Date.parse(date) }
    display_events(events_for_date)
  end
end

if __FILE__ == $PROGRAM_NAME
  events_manager = EventsManager.new
  case ARGV[0]
  when 'add'                                # eg add meet-mom 23.10.2020
    Event.create(*ARGV[1..-1])
  when 'display'                            # eg display meet-mom
    Event.new_from_file(ARGV[1]).display
  when 'delete'                             # eg delete meet-mom
    Event.delete(ARGV[1])
  when 'display-all'                        # eg display-all
    events_manager.display_all
  when 'display-for-date'                   # eg display-for-date 23.10.2020
    events_manager.display_for_date(ARGV[1])
  when 'reset'                              # eg reset
    FileManager.reset
  end
end
