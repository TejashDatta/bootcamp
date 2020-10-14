require_relative 'config'
require_relative 'event'

class EventManager
  
  def add_event(event_name, event_date)
    event = Event.new(event_name)
    event.date = event_date
    event.save_to_file
    puts %(Event: "#{event.name}" added)
  end

  def delete_event(event_name)
    event = Event.new(event_name)
    event.delete_file
    puts %(Event: "#{event.name}" deleted)
  end

  def list_events
    Dir.each_child(Config.data_directory_path) do |event_file_name|
      event = Event.new(event_file_name)
      event.read_from_file
      event.display_details
    end
  end
end
