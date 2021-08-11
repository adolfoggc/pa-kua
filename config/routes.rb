Rails.application.routes.draw do
  get 'instrutores', to: 'instructors#index'
  get 'instrutores/exibir', to: 'instructors#show'
  get 'instrutores/novo', to: 'instructors#new'
  get 'instrutores/editar', to: 'instructors#edit'
  get 'instrutores/criar', to: 'instructors#create'
  get 'instrutores/atualizar', to: 'instructors#update'
  get 'instrutores/remover', to: 'instructors#destroy'
  get 'alunos', to: 'students#index'
  get 'alunos/exibir', to: 'students#show'
  get 'alunos/novo', to: 'students#new'
  get 'alunos/editar', to: 'students#edit'
  get 'alunos/criar', to: 'students#create'
  get 'alunos/atualizar', to: 'students#update'
  get 'alunos/remover', to: 'students#destroy'
  resources :people
  devise_for :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
