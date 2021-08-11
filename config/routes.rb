Rails.application.routes.draw do
  get 'instrutores', to: 'instructors#index'
  get 'instrutores/:id', to: 'instructors#show'
  get 'instrutores/novo', to: 'instructors#new'
  get 'instrutores/:id/editar', to: 'instructors#edit'
  get 'instrutores', to: 'instructors#create'
  get 'instrutores/:id', to: 'instructors#update'
  get 'instrutores/:id', to: 'instructors#destroy'
  get 'alunos', to: 'students#index'
  get 'alunos/:id', to: 'students#show'
  get 'alunos/novo', to: 'students#new'
  get 'alunos/:id/editar', to: 'students#edit'
  get 'alunos', to: 'students#create'
  get 'alunos/:id', to: 'students#update'
  get 'alunos/:id', to: 'students#destroy'
  resources :people
  devise_for :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
