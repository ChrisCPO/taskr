require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  

  constraints Monban::Constraints::SignedIn.new do
    root "tasks#index"
  end

  constraints Monban::Constraints::SignedOut.new do
    root "users#new", as: :sign_up
  end

  resources :tasks, only: [:new, :create] do
    member do 
      post "complete" => "task_completions#create"
    end
  end
end
