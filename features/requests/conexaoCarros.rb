require 'pg'

class ConexaoBancoVeiculos
  def initialize
    host = 'lv-dev.betternow.com.br'
    database = 'Treinamento'
    user = 'postgres'
    senha = 'postgres'

    @connection = PG::Connection.new(host: host, user: user, dbname: database, port: '8002', password: senha)

    # Arrays de dados do usuário
    @dados_veiculos = []
    @price = []
    @mileage = []
    @owners = []
    @modelYear = []
    @color = []
    @carTrim = []
    @engine = []
    @transmission = []
    @vin = []

    # Executa uma consulta SELECT
    begin
      resultado = @connection.exec('SELECT * FROM fernandacadastroveiculo')
      resultado.each do |row|
        @price << row ['price']
        @mileage << row ['mileage']
        @owners << row ['owners']
        @modelYear << row['modelyear']
        @color << row ['color']
        @carTrim << row ['carTrim']
        @engine << row ['engine']
        @transmission << row ['transmission']
        @vin << row ['vin']
      end
      
    rescue PG::Error => e
      puts e.message
        ensure
            @connection.close if @connection
        end
  
    end

    def cadastro_de_veiculo
        teste = Requests.new
        @vin.each_with_index do |veiculos, i|
            @dados_veiculos = teste.cadastraVeiculoPost(@price[i], @mileage[i], @owners[i], 
            @modelYear[i],@color[i], @carTrim[i], @engine[i], @transmission[i],@vin[i])
        end
        @dados_veiculos
   end
end
