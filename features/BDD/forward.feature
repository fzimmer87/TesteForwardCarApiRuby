#language: pt
Funcionalidade: Testar página register da plataforma ForwardCar

    @CT001
    Cenario: Realizar cadastro na ForwardCar
      Dado que cadastro um novo usuario
      Quando enviar as informacoes do usuario
      Entao usuario sera cadastrado e sistema me retorna statusCode 200

    @CT002
    Cenario: Realizar cadastro na ForwardCar com usarname já existente
      Dado que cadastro um novo usuario
      Quando enviar as informacoes do usuario com usarname existente
      Entao usuario nao sera cadastrado e sistema me retorna statusCode 500

    @CT003
    Cenario: Realizar Login com usuário Cadastrado
      Dado que tenho cadastro com usarname e senha cadastrados na massa de dados
      Quando enviar informacoes para login
      Entao o sistema realiza login e me retorna status code 200

    @CT004
    Cenario: Cadastrar novo modelo de Carro
      Dado que quero cadastrar um novo veículo 
      Quando enviar informaçoes para novo cadastro
      Entao sistema me retorna o VIN do modelo que cadastrei

    @CT005
    Cenario: Consultar se novo modelo está cadastrado na funcao get
      Dado que cadastrei um novo veiculo na ForwardCar
      Quando realizo a pesquisa do modelo cadastrado
      Entao sistema me retorna VIN do carro cadastrado no GET