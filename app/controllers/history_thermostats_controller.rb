class HistoryThermostatsController < ApplicationController #controlador del historial de las temperaturas
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

  def register
  redirect_to '/'
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
    @s
    @serial=params[:serial]
    @therm=Thermostat.find_by_serial(@serial)
    if @therm
    @history_thermostat.thermostat_id=@therm.id
    @mail=params[:mail]
    @user=User.find_by_email(@mail)
    @userpass=User.where(:password => 'params[:pass]')
    if @user && @userpass && @therm.user.id == @user.id
      verifyhistory_create(@history_thermostat,@therm)
   else
    display_error_user
   end
 else
  display_error_thermostat
 end
 end

 def verifyhistory_create(history_thermostat,therm)
      respond_to do |format|
      if history_thermostat.save
        @temperature= Schedule.where(:thermostat_id => therm.id , :day_week => params[:day] , :day_time => params[:time]).last
         if @temperature==nil
         @temperature=therm.default_temperature
         end
        msg = { :status => "ok", :temperature => therm.default_temperature}
        format.json  { render :json => msg }
      else
         msg_error = { :error => "Error while trying to save"}
        format.json  { render :json => msg_error}
      end
    end
end

  def display_error_user
     respond_to do |format|
  msg_user = { :error => "Error thermostat does not belong to the user"}
        format.json  { render :json => msg_user }
  end
end

def display_error_thermostat
   respond_to do |format|
   msg_thermostat = { :error => "Error the thermostat does not exist"}
        format.json  { render :json => msg_thermostat }
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