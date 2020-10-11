module ConsumerMetrics
  GOOD_BRANDS = %w[Whirpool Samsung Sony Panasonic Hitachi]

  def brand_value(brand)
    if GOOD_BRANDS.include? brand
      'High quality'
    else
      'Generic quality'
    end
  end

  def affordable?(price)
    price < 1000
  end

  module_function

  def display_good_brands
    print('Good brands: ', GOOD_BRANDS * ', ', "\n")
  end
end

class ElectricalAppliance
  include ConsumerMetrics
  @@appliance_count = 0

  attr_reader :model_name
  attr_reader :manufacturer
  attr_accessor :power_consumption
  attr_accessor :price
  attr_accessor :extra_features

  def initialize(model_name, manufacturer)
    @@appliance_count += 1
    @model_name, @manufacturer = model_name, manufacturer
  end

  def run
    puts 'Appliance is running.'
  end
end

class Fridge < ElectricalAppliance
  attr_accessor :cooling_efficiency
  attr_reader :storage_space

  def initialize(model_name, manufacturer)
    super
  end
end

class Microwave < ElectricalAppliance

  def run(seconds)
    puts "Microwave will run for #{seconds} seconds."
  end
end

class AirConditioner < ElectricalAppliance
  attr_reader :type
  attr_accessor :ideal_room_size

  def initialize(model_name, manufacturer, type, ideal_room_size)
    super
  end

  def run(mode)
    puts "Air conditioner will run in #{mode} mode"
  end
end


