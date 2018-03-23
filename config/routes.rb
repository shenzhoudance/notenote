Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :notes
  authenticated :user do
    root 'notes#index', as: "authenticated_root"
  end

end
