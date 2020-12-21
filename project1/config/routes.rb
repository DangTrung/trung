Rails.application.routes.draw do
 mount Ckeditor::Engine => '/ckeditor'
 unless Rails.env.test?
 match '/404', to: "catch_errors#file_not_found", via: :all
 match '/500', to: "catch_errors#internal_server_error", via: :all
 match '/422', to: "catch_errors#unprocessable", via: :all
 end
  root :to => "hompage#index"
  get 'sessions/new'
  namespace :admin do
    get 'dashboard/index'
    get 'dashboard/:id' => 'dashboard#showuser', as: "dashboard_showuser"
    get 'dashboard/:id/edit' => 'dashboard#edituser', as: "dashboard_edituser"
    patch 'dashboard/:id' => 'dashboard#updateuser'
   
  end
  namespace :admin do
    get 'user' => 'user#index', as: "user_index"
    post 'user' => 'user#create'
    get 'user/new' => 'user#new', as: "user_new"
    get 'user/:id/edit' => 'user#edit', as: "user_edit"
    patch 'user/:id' => 'user#update'
    delete 'user/:id' => 'user#destroy', as: "user_destroy"
  end
  namespace :admin do
    get 'article' => 'article#index', as: "article_index"
    post 'article' => 'article#create'
    get 'article/new' => 'article#new', as: "article_new"
    get 'article/searchbytitle' => 'article#searchbytitle', as: "searchbytitle"
    get 'article/:id/edit' => 'article#edit', as: "article_edit"
    patch 'article/:id' => 'article#update'
    patch 'article/updatestatus/:id' => 'article#updatestatus', as: "updatestatus"
    delete 'article/:id' => 'article#destroy', as: "article_destroy"
   

  end
  namespace :admin do 
    get 'category' => 'category#index', as: "category_index"
    post 'category' =>'category#create'
    get 'category/new' => 'category#new', as: "category_new"
    get 'category/:id/edit' => 'category#edit', as: "category_edit"
    patch 'category/:id' => 'category#update'
    delete 'category/:id' => 'category#destroy', as: "category_destroy"
  end
  namespace :admin do 
    get 'role' => 'role#index', as: "role_index"
    post 'role' => 'role#create'
    get 'role/new' => 'role#new', as: "role_new"
    patch 'role/:id' => 'role#update'
    get 'role/:id/edit' => 'role#edit', as: "role_edit"
    delete 'role/:id' => 'role#destroy', as: "role_destroy"


  end
  get 'post/:slug' => 'hompage#showpost', as: "show"
  post 'hompage/createcommnent', as: "createcomment"
  get "/contact", to: "hompage#contact"
  get "/login", to: "sessions#new", as: "login"
  post   "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  get '/category/:slug', to: "hompage#showcate", as: "showcate"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
end
