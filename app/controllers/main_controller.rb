class MainController < ApplicationController
  def index
  	@drugs = Drug.order(:drug_name)
  end
end
