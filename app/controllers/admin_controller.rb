class AdminController < ApplicationController

  def list

    @admins = Admin.find(:all)
    @all_of_admins = @admins.size

    unless params[:need_data]
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.xml
      end
    end

  end

  def show
    @admin = Admin.find(params[:id])
    unless params[:need_data]
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.xml
      end
    end
  end

end
