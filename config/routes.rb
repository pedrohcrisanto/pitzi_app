Rails.application.routes.draw do
  get '/home' => 'home#index'
  get '/form_signature' => 'home#signature'
  get '/form_client' => 'home#client'
  post '/post_form_client' => 'home#post_form_client'
  post '/post_form_signature' => 'home#post_form_signature'

  root :to => 'home#index'
end
