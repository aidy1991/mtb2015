require 'mysql2'

class DBManager
  def initialize
    @mysql_host = 'localhost'
    @mysql_user = 'root'
    @mysql_password = ''
    @mysql_database = 'mtb'
    @client = Mysql2::Client.new host: @mysql_host, username: @mysql_user, password: @mysql_password, database: @mysql_database
  end


  def get_order_by_order_id order_id
    @client.query("SELECT * from orders where order_id=\"#{order_id}\"")
  end
end
