Rails.application.routes.draw do
  devise_for :users,
             path_names: { sign_in: :login, sign_out: :logout },
             :controllers => { :registrations => 'registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'user/tasks#index'

  namespace :admin do

    resources :students, only: %i[index show]

    resources :tasks do
      patch :make_public, on: :member
      patch :make_private, on: :member

      get :archive, on: :collection

      resources :tests, shallow: true, except: :index do
        resources :questions, shallow: true, except: :index do
          resources :answers, shallow: true, except: :index
        end
      end

      resources :essays, shallow: true, except: :index
    end
  end

  resources :user_passed_tests, only: %i[show update] do
    get :result, on: :member
  end

  resources :user_passed_essays, only: %i[show update]

  namespace :user do
    resources :tasks, only: %i[index show] do
      get :archive, on: :collection

      resources :tests, only: [] do
        post :start, on: :member
      end

      resources :essays, only: [] do
        post :start, on: :member
      end
    end
  end
end
