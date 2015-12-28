class Drug < ActiveRecord::Base
	validates :drug_name, :price,:store_id, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	
	belongs_to :store

	def self.latest
		Drug.order(:updated_at).last
	end

end
