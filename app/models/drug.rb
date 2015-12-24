class Drug < ActiveRecord::Base
	validates :drug_name, :price, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	
	def self.latest
		Drug.order(:updated_at).last
	end

end
