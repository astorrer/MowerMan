AgSystem::Application.routes.draw do

  mount Helpdesk::Engine, :at => '/helpdesk'

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    
    authenticated do
      root :to => 'dashboard#dash', as: :authenticated
    end

    root :to => 'static_pages#home'

    devise_for :users # Devise resource paths
    resources :users do
      member do
        post 'assign_admin_role'
        post 'demote_from_admin_role'
        post 'assign_manager_role'
        post 'demote_from_manager_role'
        post 'deactivate_account'
        post 'activate_account'
      end
    end

    resources :plantasks do
      collection do
        get :edit_multiple
        put :update_multiple
      end
    end

    resources :work_orders do
      collection do
        put :complete
      end
    end

    resources :misc_work_orders do
      collection do
        put :complete
      end
    end

    resources :conversations, only: [:index, :show, :new, :create] do
      member do
        post :reply
        post :trash
        post :untrash
      end
    end

    resources :records, except: [:index, :edit, :destroy]
    resources :parts, except: [:index, :show]
    resources :equipment, except: [:index]
    resources :areas, except: [:index, :show]
    resources :procedures, except: [:index, :show]
    resources :egg_timers, except: [:index, :show]

    match "/search"    =>  "plantasks#search",         via: :get

    match "/dash"      =>  "dashboard#dash",           via: :get
    match "/workloads" =>  "dashboard#workloads",      via: :get
    match "/status"    =>  "dashboard#status",         via: :get
    match "/overdue"   =>  "dashboard#overdue",        via: :get

    match "/view_good"      =>  "dashboard#view_good",     via: :get
    match "/view_warnings"  =>  "dashboard#view_warnings", via: :get
    match "/view_alerts"    =>  "dashboard#view_alerts",   via: :get
    match "/view_overdue"   =>  "dashboard#view_overdue",  via: :get

    match "/libraries" =>  "libraries#index",        via: :get  

    match "/mytasks"      =>   "my_task#mytasks",                  via: :get
    match "/myworkorders" =>   "my_workorder#myworkorders",         via: :get

    match "/home"      =>    "static_pages#home",      via: :get
    match "/about"     =>    "static_pages#about",     via: :get
    match "/contact"   =>    "static_pages#contact",   via: :get

    match "/workplanner" => "work_planner#index", via: :get
  end
end
