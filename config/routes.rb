require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :tasks, only: [:create, :destroy] do 
    member do 
      post "complete" => "task_completions#create"
      delete "rewind" => "task_completions#destroy"
    end
  end

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show", as: :home
  end

  constraints Monban::Constraints::SignedIn.new do
    root "tasks#index"
  end
end
