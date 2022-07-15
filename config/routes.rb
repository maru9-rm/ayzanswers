Rails.application.routes.draw do
  devise_for :users

  root to: 'answers#index'

  resources 'answers' do
    resources 'searches', only: :index
  end

  resources 'pastpapers' do
    resources 'searches', only: :index
  end

  resources 'storages'

  resources 'lesson_answers'

  resource 'manuals', only: :show

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
