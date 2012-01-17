class JqueryController < ApplicationController
  def index
    @describe = Describe.new
    @describes = Describe.find(:all)
  end

end
