Rails.application.routes.draw do
  get 'home/index'
  root "hello#index"
end
