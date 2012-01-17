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
    @project_id = params[:id]
    unless params[:need_data]
      @project = Project.find(@project_id)
      respond_to do |format|
        format.js
      end
    else
      @project = Project.find(@project_id)
      @des = @project.describes.length
      render :xml => { :success=> true, :project => @project }
    end

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
