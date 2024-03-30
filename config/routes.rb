Rails.application.routes.draw do
  root to: 'homest#op'
  get 'homes/about', to: 'homes#about'
  
end
