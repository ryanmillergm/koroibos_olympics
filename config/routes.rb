Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      namespace :events do
        get '/:id/medalists', to: 'search_medalists#index'
      end

      resources :olympians, only: [:index]
      resources :olympian_stats, only: [:index]
      resources :events, only: [:index]
    end
  end
end
