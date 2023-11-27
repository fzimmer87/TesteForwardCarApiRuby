require 'pg'

class ConexaoMetodos
  def initialize
    host = 'lv-dev.betternow.com.br'
    database = 'Treinamento'
    user = 'postgres'
    senha = 'postgres'

    @connection = PG::Connection.new(host: host, user: user, dbname: database, port: '8002', password: senha)

    # Arrays de dados do usuário
    @dados_usuarios = []
    @firstnames = []
    @lastnames = []
    @usernames = []
    @passwords = []

    # Executa uma consulta SELECT
    begin
      resultado = @connection.exec('SELECT * FROM fernandaregistro')
      resultado.each do |row|
        @firstnames << row['firstname']
        @lastnames << row['lastname']
        @usernames << row['username']
        @passwords << row['password']
      end
    rescue PG::Error => e
      puts e.message
    ensure
      @connection.close if @connection
    end
  end
  

  def cadastro_de_usuario
    teste = Requests.new
    @passwords.each_with_index do |password, i|
      @dados_usuarios = teste.registerPost(@firstnames[i], @lastnames[i], @usernames[i], @passwords[i])
    end
    @dados_usuarios
  end
  
  def login_de_usuario
    teste = Requests.new
    @passwords.each_with_index do |password, i|
      @dados_usuarios = teste.loginPost(@usernames[i], @passwords[i])
    end

    @dados_usuarios
  end
  
end
  