require 'sinatra'
require 'json'

get("/") do
  erb :home
end

get("/say_hello") do
  puts "\n"
  p params
  puts "\n"
  if params[:message]
    "<h3>#{params[:message]}</h3>" * 10
  else
    "you forgot the message :)"
  end
end
