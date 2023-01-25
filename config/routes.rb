Rails.application.routes.draw do
  # root 'API::V1::Posts'
  resources :posts
  # namespace :api, defaults: { format :json } do
  #   namespace :v1 do
  #     resources :posts
  #   end
  # end
end
