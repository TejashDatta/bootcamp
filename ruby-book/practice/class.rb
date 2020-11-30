# self.class.classmethods
# instance_of?
# is_a? kind_of?

# super override in normal methods

# class methods private

# class instance variable vs class variable

class ExampleClass
  @@test = 'test'

  def self.class_method
    p @@test
  end

  def instance_method
    p @@test
  end
end

instance = ExampleClass.new
ExampleClass.class_method
instance.instance_method