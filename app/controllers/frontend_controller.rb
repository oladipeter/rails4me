class FrontendController < ApplicationController

  layout "frontend"  

  def index
    @projects = Project.find(:all)
    @describes = Describe.find(:all, :conditions => { :public => true }, :order => "created_at DESC")
    @public_describes = @describes.size
    @all_of_describes = Describe.find(:all).size
  end

  def show
      @projects = Project.find(:all)
      @describes = Describe.where( :public => true )
      @describe = Describe.find(params[:id])      
        
      # if describe not public redirect to index
      unless @describe.public
        redirect_to :action => :index
      end
  end

end
