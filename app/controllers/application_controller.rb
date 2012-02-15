class ApplicationController < ActionController::Base
  protect_from_forgery
  # Devise, after successfully login redirect to backend

  def after_sign_in_path_for(resource)
    backend_index_path
  end

end
