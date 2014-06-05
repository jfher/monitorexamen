class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    if user_signed_in?
      if current_user.role != "admin" 
           @thermostat=Thermostat.find(params[:thermostat_id])
           @schedules=Schedule.all
           
      else
        redirect_to '/'
      end
    else
     redirect_to '/users/sign_in'
   end
 end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    if user_signed_in?
      if current_user.role == 'admin' 
      redirect_to '/'
      end
    else
  redirect_to '/users/sign_in'
  end
end

  # GET /schedules/new
  def new
    @therm_id= params[:thermostat_id]
    @therm_id=@therm_id.to_i
    if user_signed_in?
      if current_user.role != 'admin'
    @schedule = Schedule.new
    @schedule.thermostat_id=@therm_id
    @schedule.save
  else
    redirect_to '/'
  end
else
  redirect_to '/users/sign_in'
  end
end
  # GET /schedules/1/edit
  def edit
    if user_signed_in?
      if current_user.role == 'admin'
      redirect_to '/'
      end
    else
  redirect_to '/users/sign_in'
  end
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)
    @thermostats = Thermostat.all
    

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render action: 'show', status: :created, location: @schedule }
      else
        format.html { render action: 'new' }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:day_week, :temperature, :day_time, :thermostat_id)
    end
end
