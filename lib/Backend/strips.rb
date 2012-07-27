module Backend
	class Strips
		def initialize (subscriptions)
			@subscriptions = subscriptions
		end
		def load(date)
			strips = @subscriptions.getStrips
			strips.each do |strip|
				strip.image_url.gsub!(/\[date\]/,Time.now.strftime("%Y%m%d"))
			end
		end
	end
end
