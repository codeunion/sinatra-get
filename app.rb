require 'sinatra'
require 'json'

def show_params(params)
  puts "\n"
  p params
  puts "\n"
end

get("/") do
  erb :home
end

get("/hello/:count/:message") do
  show_params(params)

  message = "<h3>#{params[:message]}</h3>"
  number_of_repeats = params[:count].to_i
  message * number_of_repeats
end

get("/say_hello") do
  show_params(params)

  if params[:message]
    "<h3>#{params[:message]}</h3>" * 10
  else
    "you forgot the message :)"
  end
end


get("/max/:list") do
  # curious ? http://cl.ly/image/0a0y3k0w0p2x
  # '%20' is url speak for a space ' '
  
  list = params[:list].split(" ")
  max_so_far = list.first
  list.each do |item|   
    if item > max_so_far
      max_so_far = item
    end
  end
  max_so_far
end
