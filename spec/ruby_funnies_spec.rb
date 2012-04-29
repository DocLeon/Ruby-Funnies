require 'spec_helper'
require 'rack/test'
module RubyFunnies
	describe "Ruby Funnies" do
		include Rack::Test::Methods

		def app
			Sinatra::Application
		end
		describe "default" do
			it "responds with a welcome message" do
				get '/'
				last_response.body.should == "Welcome to Ruby Funnies"		
			end
		end
	end
end
