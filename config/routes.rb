Rails.application.routes.draw do
  devise_for :users,
             path_names: { sign_in: :login, sign_out: :logout }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'tests#index'

  resources :tests do

    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
  end
end
