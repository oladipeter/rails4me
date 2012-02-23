class ProjectsController < ApplicationController

  before_filter :authenticate_admin!
  layout "backend"

  # GET /projects
  # GET /projects.xml
  def index

    unless params[:need_data]
      respond_to do |format|
        format.js
      end
    else
      @projects = Project.all(:include => :describes)
      @project_list = @projects.map do |project|
        {:id => project.id, :name => project.name, :description => project.description, :describes => project.describes.size}
      end

      json = @project_list.to_json

      respond_to do |format|
        format.json { render :json=>json }
      end
    end

  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project_id = params[:id]
    @project = Project.find(@project_id)
    unless params[:need_data]
      respond_to do |format|
        format.js
      end
    else
      @projects = Project.all
      render :json => { :success => true, :projects => @projects}
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new
    respond_to do |format|
      format.js
    end
  end

  # GET /projects/1/edit
  def edit

    # Always know this
    @project_id = params[:id]

    # If don't need data create simple window
    unless params[:need_data]

      # Find the project
      @project = Project.find(@project_id)

      # Find project describes, call show_project_describes
      show_project_describes(@project_id)

      respond_to do |format|
        # Edit JS the simple window
        format.js
      end

    else # If need data for the grid or the form then

      # Find the project
      @project = Project.find(@project_id)

      # Find project describes, call show_project_describes
      show_project_describes(@project_id)

      # Project describes length
      @des = @project.describes.length

      if params[:from] == 'grid'
        # Response in xml to describes grid
        respond_to do |format|
          format.xml
        end
      else
        # Create xml to project form
        render :xml => { :success=> true, :project => @project }
      end

    end
  end

  def show_project_describes(project_id)
    @project_describes = Describe.find(:all, :conditions => ["project_id=?", project_id])
    return @project_describes
  end

  def create
    @project = Project.new(params[:project])
    
      if @project.save
        render :json => { :success => :true }
      else
        render :json => { :failure => :true }
      end

  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project_id = params[:id]
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      render :json => {:success => true}
    else
      render :json => {:failure => true}
     end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    # If project has describe then cannot delete!
    @describe = Describe.find_by_project_id(params[:id])
    if @describe
      render :json => {:failure => true}
    else
      @project.destroy
      render :json => {:success => true}
    end
    
  end
end
