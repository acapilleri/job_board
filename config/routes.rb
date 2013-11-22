Topdevjob::Application.routes.draw do
  resources :jobs

  devise_for :users

  get '/', to: 'jobs#index', constraints: { subdomain: 'jobs'}
   resources  :job_steps do
     collection do
       post  :preview
       patch :preview
       post :register
       get  :register
       get  :confirm
       get  :fine
     end
   end
   get 'perche-annunci-per-sviluppatori-italia', to: "jobs#perche", as: :perche
   root to: 'jobs#index'
end
