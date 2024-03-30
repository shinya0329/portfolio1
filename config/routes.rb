Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about'
end
