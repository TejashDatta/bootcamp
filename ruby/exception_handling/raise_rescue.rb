class InvalidVehicle < StandardError
end

def vehicle_to_wheels(vehicle_name)
  raise InvalidVehicle, 'Invalid vehicle type' unless %w[car motorcycle bus bike].include? vehicle_name

  case vehicle_name
  when 'car', 'bus'
    4
  when 'motorcycle', 'bike'
    2
  end
end

begin
  puts vehicle_to_wheels
rescue InvalidVehicle => e
  puts e.message
  puts e.backtrace
rescue StandardError => e
  puts e.message
ensure
  puts 'Thank you for using this program.'
end
