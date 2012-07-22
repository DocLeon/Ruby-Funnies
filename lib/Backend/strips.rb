module Backend
	class Strips
		def initialize (subscriptions)
			@subscriptions = subscriptions
		end
		def load
			@subscriptions.getStrips
		end
	end
end
