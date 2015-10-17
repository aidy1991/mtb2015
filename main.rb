require 'sinatra/base'
require 'unicorn'

class MainApp < Sinatra::Base
  get '/' do
    status 404
  end

  get '/getOrder/:orderId' do
    status 200
    "#{params[:orderId]}"
  end
end
