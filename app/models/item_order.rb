class ItemOrder < ApplicationRecord
	belongs_to :item
	belongs_to :order

	
#pour afficher les éléments dans le mails de confirmation
	def get_item
    	Item.find(self.item_id)
  	end
end
