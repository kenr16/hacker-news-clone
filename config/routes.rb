Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    post 'upvote'
    resources :comments do
      get 'reply'
    end
  end

  # resources :comments do
  #   resources :subcomments
  # end

end
