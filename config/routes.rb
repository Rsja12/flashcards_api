Rails.application.routes.draw do
  resources :topics do
    resources :flashcards
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
