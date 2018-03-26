describe "#{inform_contamination}" do
  context "when informed a contamination" do
      let!(:survivor_one) { Survivor.create(name: "claudemir") }
      let!(:survivor_two) { Survivor.create(name: "claudemir")) }
	  let!(:contamination) {InformInfected.create,survivor_send_id:survivor_one.id,survivor_infected_id: survivor_two.id}

      it "should done one exchanged" do
        exchanged = Survivor.exchanged(params)
        expect(item_one.inventory_id).to eq(inventory_two.id)
      end
	end
end