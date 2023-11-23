require 'pg'

begin
host = String('lv-dev.betternow.com.br')
database = String('Treinamento')
user = String('postgres')
password = String('postgres')

 connection = PG::Connection.new(:host => host, :user => user, :dbname => database, :port => '8002', :password => password)
puts 'Successfully created connection to database'

end