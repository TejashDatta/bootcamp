require_relative 'event_manager'

event_manager = EventManager.new

case ARGV[0]
when 'add-event'
  event_manager.add_event(ARGV[1], ARGV[2])
when 'delete-event'
  event_manager.delete_event(ARGV[1])
when 'show-all-events'
  event_manager.list_events
else
  print <<~HELP
    Available commands:
    
    add-event <event-name> <date>
    eg. add-event 'Meet mom' 'Oct 15'

    delete-event <event-name>
    eg. delete-event 'Meet mom'

    show-all-events
    eg. show-all-events

  HELP
end
