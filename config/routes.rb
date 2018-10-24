Rails.application.routes.draw do
  root  'keyboards#index'
  get   '/new', to: 'keyboards#new'
  post  '/new', to: 'keyboards#create'
  get   ':id/edit', to: 'keyboards#edit'
  patch ':id/update', to: 'keyboards#update'
  resources :keyboards
end
