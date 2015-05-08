require 'json'
require 'iron_mq'
require 'sinatra'

get '/' do
  erb :index
end

get '/fed' do
  erb :fed
end

post '/feed-me' do

  ironmq = IronMQ::Client.new(:token => ENV['IRON_MQ_TOKEN'], :project_id => ENV['IRON_MQ_PROJECT_ID'])
  queue = ironmq.queue(ENV['IRON_MQ_QUEUE_NAME'])
  queue.post("feeeeeed meeeee")

  redirect '/fed'
end
