class HistoryThermostatsController < ApplicationController
  before_action :set_history_thermostat, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  # GET /history_thermostats
  # GET /history_thermostats.json
  def index
    if user_signed_in?
      if current_user.role != "admin" 
           @history_thermostats = HistoryThermostat.all
      else
        redirect_to '/'
      end
    else
     redirect_to '/users/sign_in'
   end
  end
 
  # GET /history_thermostats/1
  # GET /history_thermostats/1.json
  def show
    if current_user.role == 'admin'
         redirect_to '/'
    end
  end
 #show the report for a thermostat by the id
  def report
    @user_id=Thermostat.find(params[:id].to_i).user_id
     if current_user.id == @user_id 
     @history_thermostats = HistoryThermostat.all
     else
      redirect_to '/'
     end
  end
  
  # POST /history_thermostats
  # POST /history_thermostats.json
  def create
    @history_thermostat = HistoryThermostat.new(history_thermostat_params)
    @serial=params[:serial]
    @therm=Thermostat.find_by_serial(@serial)
    if @therm
    @history_thermostat.thermostat_id=@therm.id
    @mail=params[:mail]
    @user=User.find_by_email(@mail)
    @userpass=User.where(:password => 'params[:pass]')
    if @user && @userpass && @therm.user.id == @user.id
    respond_to do |format|
      if @history_thermostat.save
        format.html { redirect_to @history_thermostat, notice: 'History thermostat was successfully created.' }
        format.json { render action: 'show', status: :created, location: @history_thermostat }
      else
        format.html { render action: 'new' }
        format.json { render json: @history_thermostat.errors, status: :unprocessable_entity }
      end
    end
   else
  format.json { render json: @history_thermostat.errors, status: :unprocessable_entity }
   end
 else
  format.json { render json: @history_thermostat.errors, status: :unprocessable_entity }
 end
  end

  # PATCH/PUT /history_thermostats/1
  # PATCH/PUT /history_thermostats/1.json
  def update
    respond_to do |format|
      if @history_thermostat.update(history_thermostat_params)
        format.html { redirect_to @history_thermostat, notice: 'History thermostat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @history_thermostat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /history_thermostats/1
  # DELETE /history_thermostats/1.json
  def destroy
    @history_thermostat.destroy
    respond_to do |format|
      format.html { redirect_to history_thermostats_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   def set_history_thermostat
      @history_thermostat = HistoryThermostat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_thermostat_params
      params.require(:history_thermostat).permit(:temperature, :humidity, :energy)
    end
end
