require 'date'
require_relative 'file_manager'

class Event
  DELIMITER = ';'.freeze
  attr_reader :name, :date

  def self.create(name, date)
    event = new(name, date)
    FileManager.write(name, event.string_representation)
    puts %(Event "#{name}" added)
    event
  end

  def self.delete(name)
    FileManager.delete(name)
    puts %(Event "#{name}" deleted)
  end

  def self.new_from_file(file_name)
    new(*FileManager.read(file_name).split(DELIMITER))
  end

  def initialize(name, date)
    @name = name
    @date = Date.parse(date)
  end

  def string_representation
    [@name, @date.to_s].join(DELIMITER)
  end

  def display
    print <<~DATA
      Name: #{@name}
        Date: #{@date}
    DATA
  end
end
