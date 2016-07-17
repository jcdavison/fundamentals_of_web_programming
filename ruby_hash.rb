person = { name: 'happy person', eye_color: 'blue', address: '500 fell st, st', happy: true, sad: :maybe}

p person
p person[:eye_color]
p person[:happy]


item = { name: 'thing1', location: :drawer, siblings: ['thing2', 'thing3'], parent: { name: 'thing parent'}}

p item
p item[:name]
p item[:parent]


car = { 'name' => 'chevy', 'motor_type' => :combustion, 'location' => [ 'somewhere in california'] }

p car['name']
p car['motor_type']

car.each do |key, value|
  p "This is the car's #{key} and it is #{value}."
end