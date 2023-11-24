require 'pg'

class ConexaoBanco
    
    host = String('lv-dev.betternow.com.br')
    database = String('Treinamento')
    user = String('postgres')
    senha = String('postgres')

    connection = PG::Connection.new(:host => host, :user => user, :dbname => database, :port => '8002', :password => senha)

   # Arrays de dados do usuário
   
   $firstnames = []
   $lastnames = []
   $usernames = []
   $passwords = []

    # Executa uma consulta SELECT
    resultado = connection.exec('SELECT * FROM fernandaregistro')
     resultado.each do |row|
     $firstnames << row['firstname']
     $lastnames << row['lastname']
     $usernames << row['username']
     $passwords << row['password']
    end


    rescue PG::Error => e
    puts e.message

    ensure
    connection.close if connection


    def registerPost 
        i = 0
        while i <= $passwords.size do
        ForwardCar.post('/register',  body: {             
            "firstname": $firstnames[0], 
            "lastname": $lastnames[i], 
            "username": $usernames[i], 
            "password": $passwords[i]
        }.to_json)    
        i+=1 
        
        end
        
    end    
    
end
    
       
        
     
    
