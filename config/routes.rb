Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/home' => 'home#index'
  get '/form_signature' => 'home#signature'
  get '/form_client' => 'home#client'
  post '/post_form_client' => 'home#post_form_client'
  post '/post_form_signature' => 'home#post_form_signature'

  root :to => 'home#index'

end
