Dummy::Application.routes.draw do
  match "/home(.:format)", :to => "home#index", :as => :home
  match "/", :to => "home#index"
end
