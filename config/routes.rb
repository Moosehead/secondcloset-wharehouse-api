Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :customers
  scope :api do
    post 'customer/create'

    post 'customer/add/:cust_id' ,to: 'customer#add'

    post 'customer/fee'

    get 'customer/list'
  end
end
