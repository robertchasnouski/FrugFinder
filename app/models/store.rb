class Store < ActiveRecord::Base
	has_many :drugs, dependent: :destroy
end
