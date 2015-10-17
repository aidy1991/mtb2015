require 'sinatra/base'
require 'unicorn'
require 'json'
require 'pp'
require_relative './db_manager'

class MainApp < Sinatra::Base
  get '/' do
    status 404
  end

  get '/getOrder/:orderId' do
    status 200

    db = DBManager.new
    order = db.get_order_by_order_id "Od345dwc"
    pp order
    pp order.first
    "#{order.to_json}"
  end
end
