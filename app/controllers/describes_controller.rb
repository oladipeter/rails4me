class DescribesController < ApplicationController

  before_filter :authenticate_admin!
  layout "backend"

  def index
    unless params[:need_data]
      respond_to do |format|
        format.js
      end
    else
      @describes = Describe.find(:all)
      render :json => { :success => :true, :describes => @describes}
    end
  end

  def show
    # @show_valtozo = "Ez itt az!!!!"
    @projects = Project.find(:all)
    @describes = Describe.find(:all)
    @describe = Describe.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @describe }
    end
  end

  def show_all
   if(params[:id])
     @describes = Describe.where("project_id = ?", params[:id])
     redirect_to describes_path, :notice => "Already you have not describe to this project!" if @describes.empty?
   end
  end

  def new
    @describe = Describe.new
    respond_to do |format|
      format.js
    end
  end


  def edit

    @describe_id = params[:id]
    @describe = Describe.find(@describe_id)
    @project_id = @describe.project.id
    @project = Project.find(@project_id)

    unless params[:need_data]
      respond_to do |format|
        format.js
      end
    else
      # render :json => {:success => true, :founded_describe => @describe}
      render :json => {
          :success => true,
          data: {
              id: "#{@describe.id}",
              title: "#{@describe.title}",
              short_description: "#{@describe.short_description}",
              long_description: "#{@describe.long_description}",
              keywords: "#{@describe.keywords}",
              gitlink: "#{@describe.gitlink}",
              feedback: "#{@describe.feedback}",
              project_id: "#{@describe.project_id}"
          }
      }
    end
  end

  def create
    @describe = Describe.new(params[:describe])    
      if @describe.save
        render :json => {:success => true}
      else
        render :json => {:failure => true}
      end    
  end

  def update
    @describe = Describe.find(params[:id])

    if @describe.update_attributes(
        :title => params[:title],
        :short_description => params[:short_description],
        :long_description => params[:long_description],
        :keywords => params[:keywords],
        :gitlink => params[:gitlink],
        :feedback => params[:feedback],
        :public => params[:public],
        :project_id => params[:project_id]
    )
      render :json => {:success => true}
    else
      render :json => {:failure => true}
    end
  end

  def destroy
    @describe = Describe.find(params[:id])
    if @describe.destroy
     render :json => {:success => true}
    else
     render :json => {:failure => true}
    end
  end

  def ajax_public
    @describe = Describe.find(params[:id])
    if params[:public] == "true"
      @describe.update_attributes(:public => false)
      redirect_to describes_path
    elsif params[:public] == "false"
      @describe.update_attributes(:public => true)
      redirect_to describes_path
    end
  end

  def show_describe_information
   @describe = Describe.find(params[:id])
  end

end
