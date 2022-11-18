Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  passwordless_for :users
  resources :users # add this line
  root to: "static#index"
end
