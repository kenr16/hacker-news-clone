Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments do
      get 'reply'
      post 'post_reply'
    end
  end

  # resources :comments do
  #   resources :subcomments
  # end

end
