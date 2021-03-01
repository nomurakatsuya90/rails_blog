Rails.application.routes.draw do
  resources :blogs do
    collection do
      post :confirm
    end
  end
  # get 'blogs/index'
  # get 'blogs/new'
  # get 'blogs/edit'
  # get 'blogs/confirm'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
