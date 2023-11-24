Dado('que cadastro um novo usuario') do
  @post_registro = ConexaoMetodos.new
end

Quando('enviar as informacoes do usuario') do
  @resp_register = @post_registro.cadastro_de_usuario 
  
end

Entao('usuario sera cadastrado e sistema me retorna statusCode {int}') do |statusCode |
      expect(@resp_register.code).to eql (statusCode)

end

Quando('enviar as informacoes do usuario com usarname existente') do
  @resp_register = @post_registro.cadastro_de_usuario
  @resp_register = @post_registro.cadastro_de_usuario
 
end

Entao('usuario nao sera cadastrado e sistema me retorna statusCode {int}') do |statusCode|
  expect(@resp_register.code).to eql statusCode
end

Dado('que tenho cadastro com usarname e senha cadastrados na massa de dados') do
  @post_login = ConexaoMetodos.new
end

Quando('enviar informacoes para login') do
  @response_login = @post_login.login_de_usuario
  
end

Entao('o sistema realiza login e me retorna status code {int}') do |statusCode|
  expect(@response_login.code).to eql statusCode

end

Dado('que quero cadastrar um novo veículo') do
  @post_novo_veiculo = Requests.new
end

Quando('enviar informaçoes para novo cadastro') do
  @response_novo_carro = @post_novo_veiculo.cadastraVeiculoPost
  
end

Entao('sistema me retorna o VIN do modelo que cadastrei') do
  expect(@response_novo_carro.code).to eql (200)
  expect(@response_novo_carro["vin"]).to eql '123456'
  expect(@response_novo_carro["modelYear"].to_s).to eql '2022'
  expect(@response_novo_carro["color"]).to eql 'blue'
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
  expect(@response_novo_carro['vin']).include? '123456'
  
end