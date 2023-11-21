Dado('que cadastro um novo usuario') do
  @post_registro = 'http://localhost:3434/cars-app/register'
end

Quando('enviar as informacoes do usuario') do
  @resp_register = HTTParty.post(@post_registro, :headers => { 'Content-Type' => 'application/json' },body: {
    
    "firstname": "Fernanda", 
    "lastname": "Zimmer", 
    "username": "zimmer8", 
    "password": "1234"

}.to_json)
puts @resp_register
puts @resp_register.code
puts @resp_register.msg
end

Entao('usuario sera cadastrado e sistema me retorna statusCode {int}') do |statusCode |
 expect(@resp_register.code).to eql statusCode
 expect(@resp_register.code).to eql statusCode
end

Quando('enviar as informacoes do usuario com usarname existente') do
 
end

Entao('usuario nao sera cadastrado e sistema me retorna statusCode {int}') do |int|
# Entao('usuario nao sera cadastrado e sistema me retorna statusCode {float}') do |float|
  pending # Write code here that turns the phrase above into concrete actions
end

Dado('que tenho cadastro com usarname e senha cadastrados na massa de dados') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('enviar informacoes para login') do
  pending # Write code here that turns the phrase above into concrete actions
end

Entao('o sistema realiza login e me retorna status code {int}') do |int|
# Entao('o sistema realiza login e me retorna status code {float}') do |float|
  pending # Write code here that turns the phrase above into concrete actions
end

Dado('que quero cadastrar um novo veículo') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('enviar informaçoes para novo cadastro') do
  pending # Write code here that turns the phrase above into concrete actions
end

Entao('sistema me retorna o VIN do modelo que cadastrei') do
  pending # Write code here that turns the phrase above into concrete actions
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