class ThermostatsController < ApplicationController
  before_filter :authenticate_user!, :except =>  [:index, :about, :contact, :edit, :update]
  before_action :set_thermostat, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
   #load_and_authorize_resource
   #authorize_resource
   #load_and_authorize_resource :through => :current_user
  # GET /thermostats
  # GET /thermostats.json

  def change_role
    @user=User.find(params[:id])

    if @user.role=="admin"
      @user.role="simple"
    else
      @user.role="admin"
    end
    @user.save
    redirect_to '/'
  end

 def block
   if current_user.role=="admin"
    @user=User.find(params[:id])
    @user.state=false
    @user.save
    redirect_to '/'
  else
  redirect_to '/'
   end
end

  def unlock
     if current_user.role=="admin"
   @user=User.find(params[:id])
    @user.state=true
    @user.save
    redirect_to '/'
  else
    redirect_to '/'
  end
  end

  def remove
     if current_user.role=="admin"
    @user=User.find(params[:id])
    @thermostats=Thermostat.all
    @thermostats.each do |therm|
      if therm.user_id == @user.id
        therm.destroy
      end
    end
    @user.destroy
    redirect_to '/'
  else
    redirect_to '/'
  end
end

  def save
      @users=User.all
      @user=User.new
      @user.email=params[:email]
      @user.password=params[:password]
      @users.each do |user|
      if @user.email == user.email
        create_user
      end
    end
      @user.save
      redirect_to '/'
  end

    def edit_user
       if current_user.role=="admin"
    @user=User.find(params[:id])
  else
    redirect_to '/'
  end
  end

  def index
    if user_signed_in? && current_user.role == "admin"
      redirect_to '/admi'
      @thermostats=Thermostat.all
    else
    if  user_signed_in?
       redirect_to '/home'
    end
  end
  end

  def create_user
     if current_user.role=="admin"
    @user=User.new
  else
    redirect_to '/'
  end
  end

  def home
    if current_user.role != "admin"
      @thermostats = Thermostat.all
    else
     redirect_to '/'
     end
  end
 
   def admi
    
    if current_user.role != "simple"
      if params[:search]
        @users = User.search(params[:search])
        @thermostats = Thermostat.all
      else
      @users= User.all
      @thermostats = Thermostat.all
      end
    else
      redirect_to '/'
    end
  end


  def report
    if current_user.role != "simple"
      @users= User.all
      @thermostats = Thermostat.all
    else
     redirect_to '/'
    end
  end

   

  # GET /thermostats/1
  # GET /thermostats/1.json
  def show
    @location=Thermostat.find(params[:id]).location_id
  end

  def history
    redirect_to show_history
  end


  # GET /thermostats/new
  def new
    if current_user.role == 'simple'
    @thermostat = Thermostat.new
  else
    redirect_to '/'
  end
  end

  # GET /thermostats/1/edit
  def edit
  end

  # POST /thermostats
  # POST /thermostats.json
  def create
  @thermostat = Thermostat.new(thermostat_params)
   @thermostat.user_id=current_user.id
    @thermostat.energy = 0
    @thermostat.humidity = 0
    respond_to do |format|
      if @thermostat.save
        format.html { redirect_to locations_home_path, notice: 'Thermostat was successfully created.' }
        format.json { render action: 'show', status: :created, location: @thermostat }
      else
        format.html { render action: 'new' }
        format.json { render json: @thermostat.errors, status: :unprocessable_entity }
      end
    end
  end
#Increases the temperature configuration
  def add
    @thermostat = Thermostat.find(params[:id])
    @thermostat.temperature = @thermostat.temperature + 1
    @thermostat.save
    redirect_to :back
  end
#Decreases the temperature configuration
  def sub
    @thermostat = Thermostat.find(params[:id])
    @thermostat.temperature = @thermostat.temperature - 1
    @thermostat.save
    redirect_to :back
  end


  # PATCH/PUT /thermostats/1
  # PATCH/PUT /thermostats/1.json
  def update
    respond_to do |format|
      if @thermostat.update(thermostat_params)
        format.html { redirect_to @thermostat, notice: 'Thermostat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @thermostat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thermostats/1
  # DELETE /thermostats/1.json
  def destroy
    @thermostat.history_thermostats.each do |history|
      history.destroy
    end

    @thermostat.destroy
    respond_to do |format|
      format.html { redirect_to thermostats_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thermostat
      @thermostat = Thermostat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thermostat_params
      params.require(:thermostat).permit(:serial, :temperature, :humidity, :energy, :user_id, :location_id)
    end
end
