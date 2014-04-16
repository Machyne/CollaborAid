class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /search
  def search
    sp = search_params
    projects = Project.all
    projects = projects.where(name: /#{sp['text']}/i) if sp['text'].present?
    projects = projects.union.in(sectors: sp['sectors']) if sp['sectors']
    projects = projects.union.in(bens: sp['bens']) if sp['bens']
    render json: projects.map(&:to_mapbox)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    unless current_user && current_user.is_admin?
      redirect_to root_path, flash: {error: 'Sorry, only the site administrator can view that page.'}
    end
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    unless current_user && current_user.is_admin?
      redirect_to root_path, flash: {error: 'Sorry, only the site administrator can view that page.'}
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    unless current_user && current_user.is_admin?
      redirect_to root_path, flash: {error: 'Sorry, only the site administrator can view that page.'}
    end
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    unless current_user && current_user.is_admin?
      redirect_to root_path, flash: {error: 'Sorry, only the site administrator can view that page.'}
    end
    respond_to do |format|
      if @project.update project_params
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    unless current_user && current_user.is_admin?
      redirect_to root_path, flash: {error: 'Sorry, only the site administrator can view that page.'}
    end
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      pp = params.require(:project).permit :name, :cname, :cemail, :descripts, :description, :sectors, :oversee, :bens, :funders, :location, :locname, :initdate, :enddate
      pp[:bens] = pp[:bens].gsub(/\[|\]|\s|\"/, '').split ','
      pp[:sectors] = pp[:sectors].gsub(/\[|\]|\s|\"/, '').split ','
      pp[:funders] = pp[:funders].gsub(/\[|\]|\s|\"/, '').split ','
      pp[:location] = pp[:location].gsub(/\[|\]|\s|\"/, '').split(',').map &:to_f
      pp[:initdate] = Date.parse(pp[:initdate])
      pp
    end

    def search_params
      return {} unless params[:search]
      if params[:search][:sectors]
        params[:search][:sectors] = params[:search][:sectors].keys
      end
      if params[:search][:bens]
        params[:search][:bens] = params[:search][:bens].keys
      end
      params[:search]
    end
end