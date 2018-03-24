class InformInfected < ApplicationRecord

	def inform_contamination(params)
       @inform_infecteds = InformInfected.where(survivor_infected_id: params[:survivor_infected_id])
       survivor_id = params[:survivor_infected_id]
       @survivor = Survivor.where(id: survivor_id)

       if @inform_infecteds.length >=3
       	    @survivor.infected(@survivor)
       end
	end
end
