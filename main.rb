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
    content_type :json

    db = DBManager.new
    order = db.get_order_by_order_id params[:orderId]
    pp order.first
    order.first
  end
end
