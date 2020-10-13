class PortableElectronic
  attr_accessor :device_name
  attr_accessor :power_state

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
  attr_accessor :screen_size
  attr_accessor :OS

  def send_email(recipient, subject, message)
    puts %(Sending "#{subject}" email to #{recipient}.)
  end
end

my_laptop = Laptop.new('HP x360')
my_laptop.switch_on
my_laptop.os = 'Ubuntu'
my_laptop.screen_size = '13.3"'
my_laptop.send_email('Tejash', 'Update', 'Some updates.')

