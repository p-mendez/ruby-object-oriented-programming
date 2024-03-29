# class GoodDog
#   def initialize
#     puts "This object was initialized"
#   end
# end

# sparky = GoodDog.new

# =begin
#  The initialize method gets called every time you create a new object.
#  That's odd, don't we call the new method when we create an object? Yes,
#  calling the new class method eventually leads us to the initialize instance method.
#  We'll talk about the difference between class methods and instance methods later.
#  In the above example, instantiating a new GoodDog object triggered the initialize
#  method and resulted in the string being outputted. We refer to the initialize method
#  as a constructor, because it is a special method that builds the object when a new
#  object is instantiated. It gets triggered by the new class method.
# =end

# class GoodDog
#   def initialize(name)
#     @name = name
#   end
# end

# sparky = GoodDog.new("Sparky")

# =begin
# You'll notice something new here. The @name variable looks different because it has the @ symbol
# in front of it. This is called an instance variable. It is a variable that exists as long as the
# object instance exists and it is one of the ways we tie data to objects. It does not "die"
# after the initialize method is run. It "lives on", to be referenced, until the object instance
# is destroyed. In the above example, our initialize method is defined with one parameter: name.
# You can pass arguments into the initialize method through the new method. Let's create an object
# using the GoodDog class from above

# From that example, we can see that instance variables are responsible for keeping track of
# information about the state of an object. In the above line of code, the name of the sparky object
# is the string "Sparky". This state for the object is tracked in the instance variable, @name.
# If we created another GoodDog object, for example, with fido = GoodDog.new('Fido'), then the @name
# instance variable for the fido object would contain the string "Fido". Every object's state is
# distinct, and instance variables are how we keep track.
# =end

# class GoodDog
#   def initialize(name)
#     @name = name
#   end

#   def get_name
#     @name
#   end

#   def set_name=(name)
#     @name = name
#   end

#   def speak
#     "#{@name} says Arf!"
#   end
# end

# sparky = GoodDog.new("Sparky")
# puts sparky.speak

# fido = GoodDog.new("Fido")
# puts fido.speak

# #puts sparky.name # <- Error

# puts sparky.get_name
# sparky.set_name = "Spartacus"
# puts sparky.get_name

# =begin
# As you can see, we've successfully changed sparky's name to the string "Spartacus".
# The first thing you should notice about the setter method set_name= is that Ruby gives
# us a special syntax to use it. To use the set_name= method normally, we would expect to
# do this: sparky.set_name=("Spartacus"), where the entire "set_name=" is the method name,
# and the string "Spartacus" is the argument being passed in to the method. Ruby recognizes
# that this is a setter method and allows us to use the more natural assignment syntax:
# sparky.set_name = "Spartacus". When you see this code, just realize there's a method called
# set_name= working behind the scenes, and we're just seeing some Ruby syntactical sugar.
# =end



=begin
Finally, as a convention, Rubyists typically want to name those getter and setter methods
using the same name as the instance variable they are exposing and setting.
We'll make the change to our code as well:
=end

# class GoodDog
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end

#   def name=(n)
#     @name = n
#   end

#   def speak
#     "#{@name} says Arf!"
#   end
# end

# sparky = GoodDog.new("Sparky")
# sparky.name = "Spartacus"
# puts sparky.name


# class GoodDog
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{@name} says arf!"
#   end
# end

# sparky = GoodDog.new("Sparky")
# puts sparky.speak
# puts sparky.name
# sparky.name = "Spartacus"
# puts sparky.name


# =begin
# The attr_accessor method takes a symbol as an argument, which it uses to create the method
# name for the getter and setter methods. That one line replaced two method definitions.


# But what if we only want the getter method without the setter method?
# Then we would want to use the attr_reader method. It works the same way but only allows you
# to retrieve the instance variable. And if you only want the setter method, you can use the
# attr_writer method. All of the attr_* methods take Symbol objects as arguments;

# if there are more states you're tracking, you can use this syntax:
#   attr_accessor :name, :height, :weight
# =end

# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n)
#     @name = n
#   end

#   def speak
#     "#{name} says Arf!"
#   end

#   def info
#     "#{name} has height: #{height} and weight: #{weight}"
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end
# end

# sparky = GoodDog.new("Sparky")
# puts sparky.name
# puts sparky.speak
# sparky.change_info("Spartacus", "24 inches", "50 pounds")
# puts sparky.info


# =begin
# The reason our setter methods didn't work is because Ruby thought we were initializing local variables.
# Recall that to initialize or create new local variables, all we have to do is x = 1 or str = "hello world".
#   It turns out that instead of calling the name=, height= and weight= setter methods, what we did was create
#   three new local variables called name, height and weight. That's definitely not what we wanted to do.

# To disambiguate from creating a local variable, we need to use self.name= to let Ruby know that we're
# calling a method.
# =end






=begin
EXERCISE 1
Create a class called MyCar. When you initialize a new instance or object of the class,
allow the user to define some instance variables that tell us the year, color, and model
of the car. Create an instance variable that is set to 0 during instantiation of the object
to track the current speed of the car as well. Create instance methods that allow the car to
speed up, brake, and shut the car off.
=end
# class MyCar
#   attr_accessor :year, :color, :model, :current_speed

#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @current_speed = 0
#   end

#   def info
#     "Year: #{year}\nColor: #{color}\nModel: #{model}\nCurrent Speed: #{current_speed}"
#   end

#   def speed_up(addition = 1)
#     self.current_speed += addition
#     puts "You are now traveling at #{current_speed} mph."
#   end

#   def brake (decrease = 1)
#     self.current_speed -= decrease
#     puts "You have decreased your speed to #{current_speed} mph."
#   end

#   def shut_off
#     self.current_speed = 0
#     puts "You have turned off your car. Your speed is now #{current_speed} mph."
#   end
# end

# car = MyCar.new(1998, "red", "Outlander")
# puts car.info
# car.speed_up 10
# car.brake 8
# car.shut_off

=begin
EXERCISE 2
Add an accessor method to your MyCar class to change and view the color of your car.
Then add an accessor method that allows you to view, but not modify, the year of your car.
=end

# class MyCar
#   attr_accessor :current_speed, :color
#   attr_reader :year

#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @current_speed = 0
#   end

#   def speed_up(add = 1)
#     self.current_speed += add
#     puts "Current speed is now #{current_speed}"
#   end

#   def brake(decrease = 1)
#     self.current_speed -= decrease
#     puts "Current speed is not #{current_speed}"
#   end

#   def shut_off
#     self.current_speed = 0
#     puts "Car is off. Current speed is #{current_speed}"
#   end
# end


# car = MyCar.new(2000, "red", "civic")
# car.speed_up 30
# car.brake
# car.shut_off
# car.color = "yellow"
# puts car.color
# puts car.year


=begin
EXERCISE 3
You want to create a nice interface that allows you to accurately describe the action
you want your program to perform. Create a method called spray_paint that can be called
on an object and will modify the color of the car.
=end

class MyCar
  attr_accessor :current_speed, :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
  end

  def speed_up(add = 1)
    self.current_speed += add
    puts "Current speed is now #{current_speed}"
  end

  def brake(decrease = 1)
    self.current_speed -= decrease
    puts "Current speed is not #{current_speed}"
  end

  def shut_off
    self.current_speed = 0
    puts "Car is off. Current speed is #{current_speed}"
  end

  def spray_paint(color)
    self.color = color
    puts "Your car is now #{color}!"
  end
end

oldCar = MyCar.new(1990, "yellow", "beetle")
oldCar.spray_paint("pink")
