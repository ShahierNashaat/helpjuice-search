Rails.application.routes.draw do
  resources :searches, only: [:index] do
    collection do
      post :save_search
    end
  end

  root "searches#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
