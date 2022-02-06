Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/books/:id" => "books#show"
  delete "/books/:id" => "books#destroy"  
  resources :publishers
  # resource :profile #indexがresourcesにはあったが、resourceの場合は、定義されない。
  resource :profile, only: %i{show edit update}
  # resources :publishers do
  #   resources :books
  #   member do
  #     get 'detail'
  #   end
  #   collection do
  #     get 'search'
  #   end
  # end
end
