class BackendController < ApplicationController

  before_filter :authenticate_admin!
  layout "backend"

  def index
    @projects = Project.find(:all)
    @describes = Describe.find(:all)
  end

  def search
    @describes = Describe.search(params[:search])
  end

end
