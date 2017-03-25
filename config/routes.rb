Rails.application.routes.draw do
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  post 'app_uninstall' => "custom_webhooks#app_uninstall"
  get 'product_variants' => "scripts#product_variants"
  get 'plan_active' => "home#plan_active"
  get 'activatecharge' => 'home#activatecharge'
  get 'home' => 'home#index'
  get 'update_script' => "scripts#update_script"
  # get 'product_variant' => "custom_scripts#product_variant"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
