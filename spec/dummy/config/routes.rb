Dummy::Application.routes.draw do
  resources :dummy do
    collection do
      get :track_event
      get :track_event_and_redirect
    end
  end
end
