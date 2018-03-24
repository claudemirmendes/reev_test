class Survivor < ApplicationRecord
	def self.infected(survivor)
		survivor.update(infected: true)
	end
end
