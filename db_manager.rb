re 'mysql2'

class DBManager
  def initialize
    @mysql_host = 'localhost'
    @mysql_user = 'root'
    @mysql_password = ''
    @mysql_database = 'mtb'
    @client = Mysql2::Client.new host: @mysql_host, username: @mysql_user, password: @mysql_password, database: @mysql_database
  end


  def find_next_user
    @client.query("START TRANSACTION")
    begin
      result = @client.query("SELECT twitter_id, cursor_#{@target} FROM users WHERE crawlable_#{@target}=TRUE LIMIT 1").first
      if result
        twitter_id = result["twitter_id"]
        cursor = result["cursor_#{@target}"].to_i
        set_uncrawlable twitter_id
      else
        twitter_id = nil
        cursor = 0
      end
    rescue => e
      @client.query("ROLLBACK");
      raise e
    end
    @client.query("COMMIT");
    {twitter_id: twitter_id, cursor: cursor}
  end
end

