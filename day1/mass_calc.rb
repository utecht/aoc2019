#!/usr/bin/env ruby

def rocket_equation(mass)
  (mass / 3).floor - 2
end

total_fuel = 0

File.open('input').each do | module_weight |
  new_fuel = 0
  module_fuel = rocket_equation(module_weight.to_i)
  while module_fuel >= 0 do
    new_fuel += module_fuel
    module_fuel = rocket_equation(module_fuel)
  end
  total_fuel += new_fuel
end

puts total_fuel


new_fuel = 0
module_fuel = rocket_equation(100756)
while module_fuel >= 0 do
  new_fuel += module_fuel
  module_fuel = rocket_equation(module_fuel)
end
puts(new_fuel)
