require 'sinatra'
require 'Haml'
require_relative 'Backend/strips'
require_relative 'Backend/strip'
require_relative 'Subscriptions'
get '/' do
	"Welcome to Ruby Funnies"
end

get '/today' do
	@strips = Backend::Strips.new(Subscriptions.new).load("today")
	haml :TodaysStrips	
end

