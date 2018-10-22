#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello,there! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@time = params[:time]
	@title = "Thank you!"
	@message = "Dear #{@username}, we will be waiting for you at #{@time}"

	f = File.open './public/users.txt', 'a'
	f.write "User: #{@username}, phone number: #{@phone}, day and time: #{@time}"
	f.close
	erb :message
end


