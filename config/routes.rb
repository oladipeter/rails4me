Rails4me::Application.routes.draw do

  get "search/index"

  get "admin/list"

  # Projects routing

  match '/projects/index' => 'projects#index', :as => 'projects_index'
  match '/projects/new' => 'projects#new', :as => 'new_project'
  match '/projects/show' => 'projects#show', :as => 'show_project'
  match '/projects/create' => 'projects#create', :as => 'create_project'
  match '/projects/edit' => 'projects#edit', :as => 'edit_project'
  match '/projects/update/:id' => 'projects#update', :as => 'update_project'
  match '/projects/destroy' => 'projects#destroy', :as => 'destroy_project'

  # Describes routing

  match '/describes/index' => 'describes#index', :as => 'describes_index'
  match '/describes/new' => 'describes#new', :as => 'new_describe'
  match '/describes/create' => 'describes#create', :as => 'create_describe'
  match '/describes/edit' => 'describes#edit', :as => 'edit_describe'
  match '/describes/update/:id' => 'describes#update', :as => 'update_describe'
  match '/describes/destroy' => 'describes#destroy', :as => 'destroy_describe'
  match '/describes/show_describe_information' => 'describes#show_describe_information', :as => 'show_describe_information'

  # Admin routing

  match '/admin/list' => 'admin#list', :as => 'admin_list'
  match '/admin/show' => 'admin#show', :as => 'admin_show'

  # Search Routing

  match '/search/search' => 'search#search', :as => 'search'
  match '/search/founded_items' => 'search#founded_items', :as => 'founded_items'


  #-------------------------------------------------------------------------------------------------------------------#
  #-------------------------------------------------------------------------------------------------------------------#

  # Others

  get "jquery/index"
  root :to => "frontend#index", :path => "/"
  get "frontend/index"
  get "backend/index"
  # resources :describes
  match '/describes/:id' => 'describes#show', :as => 'backend_describe_show', :path => '/backend/describe/:id'
  # match '/backend/search' => 'backend#search', :as => 'search', :path => '/backend/search'

  devise_for :admins do
    get "admin", :to => "devise/sessions#new"
  end

  scope :path_names => { :show_all => "allprojects" } do
    resources :describes do
      get 'show_all', :on => :member
    end    
  end  

  resources :frontend do
    member do
      get 'show'
    end
  end

end
