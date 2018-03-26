describe "#exchanged" do
	context "when done an exchanged" do
      let!(:inventory_one) { Inventory.create(survivor_id: 2) }
      let!(:inventory_two) { Inventory.create(survivor_id: 1) }
      let!(:item_one) {Item.create(inventory_id: inventory_one.id)}
      let!(:item_two) {Item.create(inventory_id: inventory_two.id)}

      let(:params) {
      	"items_send" [
      		"id" : item_one.id
      	]
       "items_received" [
      		"id" : item_two.id
      	]
      }

      it "should done one exchanged" do
        exchanged = Survivor.exchanged(params)
        expect(item_one.inventory_id).to eq(inventory_two.id)
      end
	end
 end