Rails.application.routes.draw do
  root 'dashboard#index'

  scope 'planos' do
    get '/', to: 'plans#index', as: :plans_index
    scope(path_names: { new: 'novo', edit: 'editar' }) do
      resources :tuition_fees, path: 'mensalidades'
      resources :rents, path: 'alugueis'
      resources :discounts, path: 'descontos'
    end
  end
  scope(path_names: { new: 'novo', edit: 'editar' }) do
    resources :people, path: 'membros'
  end

  get 'instrutores', to: 'instructors#index'
  get 'instrutores/novo', to: 'instructors#new'
  get 'instrutores/:id', to: 'instructors#show'
  get 'instrutores/:id/editar', to: 'instructors#edit'
  get 'instrutores', to: 'instructors#create'
  get 'instrutores/:id', to: 'instructors#update'
  get 'instrutores/:id', to: 'instructors#destroy'
  get 'alunos', to: 'students#index'
  get 'alunos/novo', to: 'students#new'
  get 'alunos/:id', to: 'students#show'
  get 'alunos/:id/editar', to: 'students#edit'
  get 'alunos', to: 'students#create'
  get 'alunos/:id', to: 'students#update'
  get 'alunos/:id', to: 'students#destroy'
  devise_for :members, controllers: {
    sessions: 'member/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
