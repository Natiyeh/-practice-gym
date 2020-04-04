Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get    'pages/contact'
  get    'pages/about'

  get    "memberships",          to: "memberships#index"

  get    "memberships/new",      to: "memberships#new",  as: :new_membership
  post   "memberships",          to: "memberships#create"

  get    "memberships/:id/edit", to: "memberships#edit", as: :edit_membership
  patch  "memberships/:id",      to: "memberships#update"

  delete "memberships/:id",      to: "memberships#destroy"
end
