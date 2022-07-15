Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'registration/patient'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'home#index'
  resources :patients
end
