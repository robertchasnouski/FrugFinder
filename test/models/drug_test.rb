require 'test_helper'

class DrugTest < ActiveSupport::TestCase
  test "drug attributes must not be empty" do 
  	drug=Drug.new
  	assert drug.invalid?
  	assert drug.errors[:drug_name].any?
  	assert drug.errors[:price].any?
  end

  test "price must be positive" do
  	drug=Drug.new(
  		drug_name: "Meskalin",
  		available:true
	)
	drug.price=-1
	assert drug.invalid?
    assert_equal ["must be greater than or equal to 0.01"], drug.errors[:price]
  
    drug.price=0
    assert drug.invalid?
    drug.price=1
    assert drug.valid?
  end 
end
