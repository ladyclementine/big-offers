Rails.application.routes.draw do

  devise_for :admins , controllers: {
    sessions: 'admins/sessions'
  },
  path: "/",
  path_names: { sign_in: 'admin/login',
                sign_out: 'admin/logout',
              }
  devise_scope :admin do
    authenticated :admin do
      resources :admins, only: [:destroy, :update, :edit]
      get '/admin/cadastro', to: 'admins#new'
      post '/admin/cadastro' => 'admins#create', as: :new_admin

      root 'dashboard#index',  as: :authenticated_admin_root
      get 'admin' => 'dashboard#index'
      get 'admins' => 'admins#index'
    end
  end
  root to: 'landing_page#index'
end
