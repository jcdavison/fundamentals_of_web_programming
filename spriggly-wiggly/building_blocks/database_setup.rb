require 'data_mapper'

DataMapper.setup(:default, 'sqlite:spriggly-wiggly.db')

class Restaurant
  include DataMapper::Resource

  property :id, Serial
  property :location, Text, required: true
  property :name, Text, required: true 

  has n, :orders, :constraint => :destroy  
end

class Order
  include DataMapper::Resource

  property :id, Serial
  property :description, Text, required: true
  property :restaurant_id, Integer, required: true

  belongs_to :restaurant
end

DataMapper.finalize()
DataMapper.auto_upgrade!()
