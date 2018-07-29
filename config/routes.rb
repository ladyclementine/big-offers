Rails.application.routes.draw do

  devise_scope :admin do
    authenticated  do
      root 'dashboard#index',  as: :authenticated_admin_root
    end
  end
  devise_for :admins , controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  },
  path: "/",
  path_names: { sign_in: 'admin/login',
                sign_out: 'admin/logout',
                registration: 'admin',
                sign_up: 'cadastro' ,
              }
  devise_scope :admins do
    get 'admin' => 'dashboard#index'
    authenticated :admin do
    end
  end
  root to: 'landing_page#index'
end
