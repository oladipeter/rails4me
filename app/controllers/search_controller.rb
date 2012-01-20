class SearchController < ApplicationController

  def search
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

  def founded_items

    unless params[:need_data]  # Just appear the window
      respond_to do |format|
        @search_value = params[:search_value] # in the window send request with this param
        @describes = Describe.search(params[:search_value]) # Search in database
        if @describes == [] # If result is empty array
         format.js { render :partial => "no_result.js.erb" }
        else
         format.js # founded items js will run, and that code do another request wth need_data
        end
      end
    else
      respond_to do |format|
        @describes = Describe.search(params[:search_value])
        format.xml
      end
    end

  end

end
