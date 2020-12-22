Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'

  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'get_data' => "services#store_pricing"
      get '/service/:servicecode/region/:location' => "services#get_pricing"
      post 'create_service' => "services#create_service"
      post 'create_service_term' => "service_terms#create_service_term"
    end
  end
end
