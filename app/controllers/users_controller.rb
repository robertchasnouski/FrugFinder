class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :require_login

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    user=@user

    respond_to do |format|
      if @user.save
        signin(@user)
        format.html { redirect_to user }
        #session[:seen]=true
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'index' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def destroy_all
    @users=User.all
    @users.destroy_all
    redirect_to '/users'
  end



  ############
  #PRIVATESECTION#
  ############

  private

  def set_user
    @user=User.find(params[:id])
  end

  def some_code
    if current_user==nil
      redirect_to '/users/new'
    else

      redirect_to current_user
    end
  end



  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:latitude, :longitude, :address, :name)
  end
end
