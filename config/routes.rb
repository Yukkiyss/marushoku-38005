Rails.application.routes.draw do

  get 'stores/index'
  root to: 'stores#index'

end
