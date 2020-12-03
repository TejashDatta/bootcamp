# call class method within instance method
self.class.classmethod

# inheritance
ExampleClass.superclass
ExampleClass.methods

example_object.instance_of? ExampleClass / .is_a?

# can call super within any function similarly to in initialize

# private class method
private_class_method :method

class << self
  private

  def classmethod
  end
end

# class instance variable: can't be accessed by child class or instance methods of class, unlike class variable

undef method

# monkey patch

class String
  def p
    p self
  end
end

# singleton

string = 'String'

def string.p
  p self
end

class << string
  def ...
end

'lol'.respond_to? :split

# modules can't have instances, instance variables, or inherit

# extend vs include: extend makes modules methods into class methods

# modules and classes

ExampleClass.include? ExampleModule

ExampleClass.included_modules

ExampleClass.ancestors

ExampleClass.is_a? ExampleModule # => true

# extend object
string.extend(ExampleModule)

# namespace

class ExampleClass::ExampleModule
end

# singleton

require 'singleton'

class SingletonExample
  include SingleTon

  def initialize
    @var = 20
  end
end

singleton_object = SingletonExample.instance

# prepend

ExampleClass.prepend ExampleModule

# refinements

module RefinementModule
  refine String do
    def p
      p self
    end
  end
end

class ExampleClass
  using RefinementModule
end
