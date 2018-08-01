Rails.application.routes.draw do

  namespace :api do
    get 'offers' => 'offers/offers#index'
  end

  devise_for :admins , controllers: {
    sessions: 'admins/sessions'
  },
  path: "/",
  path_names: { sign_in: 'admin/login',
                sign_out: 'admin/logout',
              }
  devise_scope :admin do
    authenticated :admin do
      resources :offers, only: [:update]
      #ver lista de ofertas
      get '/ofertas' => 'offers#index', as: :offers
      
      #criar oferta
      post '/ofertas' => 'offers#create', as: :new_offer
      
      #editar oferta
      get '/oferta/:id/editar' => 'offers#edit', :as => 'edit_offer'
      
      #arquivar oferta
      put '/oferta/:id/arquivar' => 'offers#archive', :as => 'archive_offer'
      
      #ver lista de ofertas arquivadas
      get '/ofertas/arquivadas' => 'offers#archived_list', as: :archived_list

      resources :admins, only: [:destroy, :update, :edit, :delete]
      
      get '/admin/cadastro', to: 'admins#new'
      post '/admin/cadastro' => 'admins#create', as: :new_admin
      
      root  'offers#index',  as: :authenticated_admin_root

      get 'admins' => 'admins#index'
    end
  end
  root  'offers#index',  as: :unauthenticated_admin_root
end
