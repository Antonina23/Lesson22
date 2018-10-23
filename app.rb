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
	@barber = params[:barber]
	@title = "Thank you!"
	@message = "Dear #{@username}, we will be waiting for you at #{@time}, your master is #{@barber}"

	f = File.open './public/users.txt', 'a'
	f.write "\nUser: #{@username},\nPhone number: #{@phone},\nDay and time: #{@time},\nBarber: #{@barber}"
	f.close
	erb :message
end


