Dummy::Application.routes.draw do
  get "/home(.:format)", :to => "home#index", :as => :home
  get "/", :to => "home#index"
end
