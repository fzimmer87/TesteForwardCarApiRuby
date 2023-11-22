Dado('que cadastro um novo usuario') do
  @post_registro = 'http://localhost:3434/cars-app/register'
end

Quando('enviar as informacoes do usuario') do
  @resp_register = HTTParty.post(@post_registro, :headers => { 'Content-Type' => 'application/json' },body: {
    
    "firstname": "Fernanda", 
    "lastname": "Zimmer", 
    "username": "zimmerf", 
    "password": "1234"

}.to_json)
puts @resp_register
puts @resp_register.code
puts @resp_register.msg

end

Entao('usuario sera cadastrado e sistema me retorna statusCode {int}') do |statusCode |
 expect(@resp_register.code).to eql statusCode
 expect(@resp_register.msg).to eql 'OK'
end

Quando('enviar as informacoes do usuario com usarname existente') do
  @resp_register = HTTParty.post(@post_registro, :headers => { 'Content-Type' => 'application/json' },body: {
    
  "firstname": "Fabiana", 
  "lastname": "Zimmer", 
  "username": "zimmerf", 
  "password": "1234"

}.to_json)
puts @resp_register
puts @resp_register.code
puts @resp_register.msg
 
end

Entao('usuario nao sera cadastrado e sistema me retorna statusCode {int}') do |statusCode|
  expect(@resp_register.code).to eql statusCode
end

Dado('que tenho cadastro com usarname e senha cadastrados na massa de dados') do
  @post_login = 'http://localhost:3434/cars-app/api/login'
end

Quando('enviar informacoes para login') do
  @response_login = HTTParty.post(@post_login, :headers => { 'Content-Type' => 'application/json' },body: {
    
  
    "username": "zimmer2",
    "password": "1234"
  

}.to_json)
puts @response_login
puts @response_login.code
puts @response_login.msg
end

Entao('o sistema realiza login e me retorna status code {int}') do |statusCode|
  expect(@response_login.code).to eql statusCode
  expect(@response_login["firstname"]).to eql 'Fernanda'
end

Dado('que quero cadastrar um novo veículo') do
  @post_novo_veiculo = 'http://localhost:3434/cars-app/carShop/cars'
end

Quando('enviar informaçoes para novo cadastro') do
  @response_novo_carro=HTTParty.post(@post_novo_veiculo, :headers => { 'Content-Type' => 'application/json' },body: {
    "dealer": {
      "class": "com.ca.lisa.demo.CarDealer",
      "id": 4,
      "address": "1673 Blake Rd",
      "city": "Aurora",
      "name": "Aurora Acura",
      "state": "CO",
      "telephone": "303-955-0134",
      "website": "www.aurora_acura.com",
      "zip": "80203"
    },
    "model": {
      "class": "com.ca.lisa.demo.CarModel",
      "id": 5,
      "fuelType": "Gas",
      "make": {
        "class": "com.ca.lisa.demo.CarMake",
        "id": 1,
        "name": "Acura"
      },
      "modelYear": 1996,
      "name": "TL-AWD",
      "subName": "SH-AWD",
      "type": {
        "class": "com.ca.lisa.demo.CarType",
        "id": 7,
        "name": "Sedan"
      }
    },
    "stockNumber": "2",
    "price": "50000",
    "milage": "55",
    "owners": "1",
    "modelYear": "2020",
    "color": "black",
    "carTrim": "12",
    "engine": "1.6",
    "transmission": "automatic",
    "vin": "007337199",
    "options": "no",
    "image1": "dewdwef",
    "image2": "wefew"
  }.to_json
  )
  
end

Entao('sistema me retorna o VIN do modelo que cadastrei') do
  expect(@response_novo_carro.code).to eql (200)
  expect(@response_novo_carro["vin"]).to eql '007337199'
  expect(@response_novo_carro["modelYear"].to_s).to eql '2020'
  expect(@response_novo_carro["color"]).to eql 'black'
end

Dado('que cadastrei um novo veiculo na ForwardCar') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('realizo a pesquisa do modelo cadastrado') do
  pending # Write code here that turns the phrase above into concrete actions
end

Entao('sistema me retorna VIN do carro cadastrado no GET') do
  pending # Write code here that turns the phrase above into concrete actions
end