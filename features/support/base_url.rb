module ForwardCar
include HTTParty
base_uri 'http://localhost:3434/cars-app'
format :json
headers 'Content-Type': 'application/json'
end
