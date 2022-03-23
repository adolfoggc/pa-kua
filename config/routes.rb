Rails.application.routes.draw do
  
  authenticated :member do
    devise_for :members, controllers: {
      sessions: 'member/sessions'
    }

    resources :class_instructors
    resources :pakua_classes
    resources :payments
    root 'dashboard#index'

    get '/example', to: 'dashboard#example', as: 'dashboard_example'

    get '/planos_dos_alunos', to: 'student_plans#index', as: :student_plans
    post '/planos_dos_alunos', to: 'student_plans#create'
    scope 'aluno/:person_id/plano' do
      get '/novo', to: 'student_plans#new', as: :new_student_plan
      get '/editar', to: 'student_plans#edit', as: :edit_student_plan
      get '/', to: 'student_plans#show', as: :student_plan
      patch '/', to: 'student_plans#update'
      put '/', to: 'student_plans#update'
      delete '/', to: 'student_plans#destroy'
    end

    get '/faixas', to: 'belts#index', as: :belts
    post '/faixas', to: 'belts#create'
    scope 'aluno/:person_id/faixa' do
      get '/nova', to: 'belts#new', as: :new_belt
      get ':id/editar', to: 'belts#edit', as: :edit_belt
      get '/', to: 'belts#show', as: :belt
      get '/:id/mudar_faixa', to: 'belts#change_belt', as: :change_belt
    end

    scope 'aluno/:id/faixa' do
      patch '/', to: 'belts#update'
      put '/', to: 'belts#update'
      delete '/', to: 'belts#destroy'
    end

    scope 'administrativo' do
      get '/', to: 'dashboard#administrative_index', as: :administrative_index
      scope(path_names: { new: 'novo', edit: 'editar' }) do 
        resources :tuition_fees, path: 'mensalidades'
        resources :rents, path: 'alugueis'
        resources :discounts, path: 'pacotes'
      end
    end

    scope(path_names: { new: 'novo', edit: 'editar' }) do
      resources :people, path: 'membros'
    end

    #payments
    post '/novo_pagamento/:id/', to: 'payments#new_student_payment', as: 'new_student_payment'
    post '/receber_pagamento/:id/', to: 'payments#recive_payment', as: 'recive_payment'

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
    get 'membros/:id/informacao', to: 'people#edit_information', as: 'edit_information'
    
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end

  unauthenticated :member do
    get '/inscricao', to: 'people#new_student_form', as: 'new_student_form'
    post '/membros', to: 'people#create', as: 'create_new_student'
    get '/boas_vindas', to: 'dashboard#welcome', as: 'welcome'
  end
end
