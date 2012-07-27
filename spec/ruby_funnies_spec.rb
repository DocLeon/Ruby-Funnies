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
		describe "today" do
			it "includes todays date" do
				@strips = double("Backend::Strips")
				Backend::Strips.should_receive(:new).with(any_args).and_return(@strips)
				@strips.should_receive(:load).with("today").and_return([Backend::Strip.new(:title,:url)])
				get '/today'	
				last_response.body.should include Time.now.strftime("%m/%d/%Y")
			end
		end
	end
end
