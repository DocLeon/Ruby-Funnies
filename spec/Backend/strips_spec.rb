require 'spec_helper'

module Backend
	describe 'Strips' do
		describe 'load' do
			it "loads gets strips to load from subscriptions" do
				@subscriptions = double("Backend::Subscriptions")
				@subscriptions.stub(:getStrips).with(no_args).and_return([Strip.new(:stripTitle1, "stripUri1"),Strip.new(:stripTitle2, "stripUri2")])
				strips = Backend::Strips.new(@subscriptions)
				strips.load("today").count.should == 2
			end

			it "links to todays strip" do
				@subscriptions = double("Backend::Subscriptions")
				@subscriptions.stub(:getStrips).with(no_args).and_return([Strip.new(:stripTitle1, "[date]")]);
				strips = Backend::Strips.new(@subscriptions)
				strips.load("today").each do |strip|
					strip.image_url.should ==(Time.now.strftime("%Y%m%d"))
				end
			end
		end		
	end
end