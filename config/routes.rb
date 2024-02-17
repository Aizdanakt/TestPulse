Rails.application.routes.draw do
  devise_for :users,
             path_names: { sign_in: :login, sign_out: :logout },
             :controllers => { :registrations => 'registrations'}

  root 'user/tasks#index'
  get 'set_theme', to: 'theme#update'

  namespace :admin do

    resources :students, only: %i[index show destroy] do
      get '/tasks/:task_id/result', to: 'students#result', on: :member, as: :task_result
    end

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

  resources :user_passed_tests, only: %i[show update]

  resources :user_passed_essays, only: %i[show update]

  namespace :user do
    resources :tasks, only: %i[index show] do
      get :archive, on: :collection
      get :result, on: :member

      resources :tests, only: [] do
        post :start, on: :member
      end

      resources :essays, only: [] do
        post :start, on: :member
      end
    end
  end
end
