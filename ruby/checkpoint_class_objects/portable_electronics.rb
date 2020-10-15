class PortableElectronic
  attr_accessor :device_name, :manufacturer_name, :power_state,
                :screen_size, :screen_resolution, :screen_type,
                :battery_capacity, :battery_charge_level,
                :storage_capacity, :ram_capacity, :weight

  def initialize(device_name)
    @device_name = device_name
    @power_state = 'off'
  end

  def charge
    puts "#{@device_name} is charging."
  end

  def switch_on
    @power_state = 'on'
  end

  def switch_off
    @power_state = 'off'
  end
end

class MobilePhone < PortableElectronic
  attr_accessor :camera_count, :speaker_count, :network_strength, :port_type,
                :download_speed, :upload_speed

  def call(recipient)
    puts "Calling #{recipient}"
  end

  def send_text(recipient, message)
    puts %(Sending "#{message}" to #{recipient}.)
  end
end

iphone = MobilePhone.new('iPhone')
iphone.switch_on
puts iphone.device_name
iphone.device_name = 'iPhone 11 Pro'
iphone.call('Tejash')
iphone.send_text('Tejash', 'Hello, how are you?')
iphone.charge

class Laptop < PortableElectronic
  attr_accessor :operating_system, :storage_type, :port_specification,
                :form_factor, :keyboard_backlight, :has_touchscreen

  def send_email(recipient, subject, _message)
    puts %(Sending "#{subject}" email to #{recipient}.)
  end
end

my_laptop = Laptop.new('HP x360')
my_laptop.switch_on
my_laptop.operating_system = 'Ubuntu'
my_laptop.screen_size = '13.3"'
my_laptop.send_email('Tejash', 'Update', 'Some updates.')
