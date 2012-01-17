class WelcomeController < ApplicationController

  before_filter :authenticate_admin!
  
  def start
    @projects = Project.find(:all)
  end

end
