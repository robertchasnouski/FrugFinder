class DrugsController < ApplicationController
  before_action :set_drug, only: [:show, :edit, :update, :destroy]

  # GET /drugs
  # GET /drugs.json
  def index
    @drugs = Drug.all
  end

  def show
  end

  def new
    @store = Store.find(params[:store_id])
    @drug = @store.drugs.build
  end


  def finddrug

  end

  def searchresult
    @search_line=SearchLine.new(:name =>  params[:name], :user_name =>current_user.name)
    @search_line.save
    @user=User.find(params[:user_id])
    @drugs=Drug.where(:drug_name => params[:name])
  end

  def edit
  end

  def create
    @store=Store.find(params[:store_id])
    @drug = @store.drugs.build(drug_params)

    respond_to do |format|
      if @drug.save
        format.html { redirect_to store_path(@store.id), notice: 'Drug was successfully created.' }
        format.json { render action: 'show', status: :created, location: @drug }
      else
        format.html { render action: 'new' }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drugs/1
  # PATCH/PUT /drugs/1.json
  def update
    respond_to do |format|
      if @drug.update(drug_params)
        format.html { redirect_to @drug, notice: 'Drug was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drugs/1
  # DELETE /drugs/1.json
  def destroy
    @drug.destroy
    respond_to do |format|
      format.html { redirect_to drugs_url }
      format.json { head :no_content }
    end
  end

  private

  def set_drug
    @drug = Drug.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def drug_params
    params.require(:drug).permit(:drug_name, :price)
  end




end
