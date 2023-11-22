Dado('que cadastro um novo usuario') do
  @post_registro = Requests.new
end

Quando('enviar as informacoes do usuario') do
  @resp_register = @post_registro.registerPost('Fernanda','Zimmer','zimmer9','1234')

puts @resp_register
puts @resp_register.code
puts @resp_register.msg

end

Entao('usuario sera cadastrado e sistema me retorna statusCode {int}') do |statusCode |
 expect(@resp_register.code).to eql statusCode
 expect(@resp_register.msg).to eql 'OK'
end

Quando('enviar as informacoes do usuario com usarname existente') do
  @resp_register = @post_registro.registerPost('Fernanda','Zimmer','zimmer00','1234')
  @resp_register = @post_registro.registerPost('Fabiana','Zimmer','zimmer10','1234')
 
end

Entao('usuario nao sera cadastrado e sistema me retorna statusCode {int}') do |statusCode|
  expect(@resp_register.code).to eql statusCode
end

Dado('que tenho cadastro com usarname e senha cadastrados na massa de dados') do
  @post_login = Requests.new
end

Quando('enviar informacoes para login') do
  @response_login = @post_login.loginPost('zimmer00','1234')
  
end

Entao('o sistema realiza login e me retorna status code {int}') do |statusCode|
  expect(@response_login.code).to eql statusCode
  # expect(@response_login["firstname"]).to eql "Fernanda"
end

Dado('que quero cadastrar um novo veículo') do
  @post_novo_veiculo = Requests.new
end

Quando('enviar informaçoes para novo cadastro') do
  @response_novo_carro = @post_novo_veiculo.cadastraVeiculoPost
  
end

Entao('sistema me retorna o VIN do modelo que cadastrei') do
  expect(@response_novo_carro.code).to eql (200)
  expect(@response_novo_carro["vin"]).to eql '007337199'
  expect(@response_novo_carro["modelYear"].to_s).to eql '2020'
  expect(@response_novo_carro["color"]).to eql 'black'
end

Dado('que cadastrei um novo veiculo na ForwardCar') do
  @post_novo_veiculo = Requests.new
  @post_novo_veiculo.cadastraVeiculoPost
end

Quando('realizo a pesquisa do modelo cadastrado') do
  @response_novo_carro = @post_novo_veiculo.consultaVeiculoGet
end

Entao('sistema me retorna VIN do carro cadastrado no GET') do
  expect(@response_novo_carro.code).to eql (200)
  # expect(@response_novo_carro["vin"]).to eql '007337199'
end