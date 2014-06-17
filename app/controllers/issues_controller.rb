class IssuesController < ApplicationController #controlador de los problemas del termostato
  before_action :set_issue, only: [:show, :edit, :update, :destroy, :cancel]
  before_filter :authenticate_user!

  # GET /issues
  # GET /issues.json
  def index
    issues_permissions
    @id_therm=params[:id]
    @id_therm=@id_therm.to_i
    if @id_therm != 0
      @issues = Issue.all
  else
    redirect_to '/'
  end
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
     #issues_permissions
  end

  def cancel
    @issue.status = "Canceled"
    @issue.save
    respond_to do |format|
        format.html { redirect_to '/', notice: "Canceled"}
        format.json { render json: {:status => @issue.status} }
      end
  end

  def open
      @issue=Issue.find(params[:id])
    if current_user.role == 'admin' && @issue.status != "Open" && @issue.status != "Canceled"
      @issue.status="Open"
      @issue.save
    end
    redirect_to '/'
  end

  def resolve
    @issue=Issue.find(params[:id])
    if current_user.role == 'admin' && @issue.status != "Resolved" && @issue.status != "Canceled"
    @issue.status="Resolved"
    else
    redirect_to '/'
  end
  end

  # GET /issues/new
  def new
   issues_permissions
    @id_therm=params[:id]
    @id_therm=@id_therm.to_i
    if @id_therm != 0
    @issue = Issue.new
    @issue.thermostat_id=@id_therm
  else
    redirect_to '/'
  end
  end

  # GET /issues/1/edit
  def edit
   issues_permissions
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)
    @issue.status="Open"
    @issue.resolution=""

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @issue }
      else
        format.html { render action: 'new' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    issues_permissions
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:description, :status, :resolution, :thermostat_id)
    end

    def issues_permissions
    @thermostat = Thermostat.find(params[:id])
       if @thermostat.user_id != current_user.id
       redirect_to '/'
       end
    end
end
