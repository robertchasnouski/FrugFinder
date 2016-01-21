class MainController < ApplicationController
  def index
    @drugs = Drug.order(:drug_name)
    @search_lines =SearchLine.all.limit(10)
  end
end
