class ThermostatsController < ApplicationController
  before_action :set_thermostat, only: [:show, :edit, :update, :destroy]
   #load_and_authorize_resource
   #authorize_resource
   #load_and_authorize_resource :through => :current_user
  # GET /thermostats
  # GET /thermostats.json
  def index
    if user_signed_in? && current_user.id ==1
      redirect_to '/admi'
      @thermostats=Thermostat.all
    else
    if    user_signed_in?
       redirect_to '/home'
      
    end
  end
end

   def home
    @thermostats = Thermostat.all
   end
 
   def admi
    @users= User.all
    @thermostats = Thermostat.all

   end

  # GET /thermostats/1
  # GET /thermostats/1.json
  def show
  end

  # GET /thermostats/new
  def new
    @thermostat = Thermostat.new
  end

  # GET /thermostats/1/edit
  def edit
  end

  # POST /thermostats
  # POST /thermostats.json
  def create
    @thermostat = Thermostat.new(thermostat_params)
    @thermostat.user_id=current_user.id
    respond_to do |format|
      if @thermostat.save
        format.html { redirect_to @thermostat, notice: 'Thermostat was successfully created.' }
        format.json { render action: 'show', status: :created, location: @thermostat }
      else
        format.html { render action: 'new' }
        format.json { render json: @thermostat.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:thermostat).permit(:serial, :temperature, :humidity)
    end
end
