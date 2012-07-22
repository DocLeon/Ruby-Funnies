require 'spec_helper'

module Backend
	describe 'Strips' do
		describe 'load' do
			it "loads gets strips to load from config" do
				@subscriptions = double("Backend::Config")
				@subscriptions.stub(:getStrips).with(no_args).and_return([Strip.new(:stripTitle1, :stripUri1),Strip.new(:stripTitle2, :stripUri2)])
				strips = Backend::Strips.new(@subscriptions)
				strips.load.count.should == 2
			end
		end		
	end
end