Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # You can have the root of your site routed with "root"
  root "home#index"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  resources :academy_applications
  get "apply"         => "academy_applications#new"

  resources :enquiries
  get "enquire"       => "enquiries#new"

  resources :women_in_tech_scholarships
  get "women-in-tech/apply"                   => "women_in_tech_scholarships#new"
  get "women-in-tech/scholarship-information"  => "pages#women_in_tech_scholarship"

  resources :posts
  resources :info_session_attendees
  resources :info_session_dates
  get "information_sessions"   => "info_session_dates#index"

  get "faq"                       => "pages#faq"
  get "curriculum"                => "pages#curriculum"
  get "about"                     => "pages#about"
  get "about/instructors"         => "pages#instructors"
  get "contact"                   => "pages#contact"
  get "privacy"                   => "pages#privacy"
  get "confirmation"              => "pages#confirmation"
  get 'vet-fee-help'              => "pages#vet_fee_help"
  get 'partners'                  => "pages#partners"
  get 'testimonials'              => "pages#testimonials"
  # get 'video-archive'             => "pages#video_archive"

  get "blog"          => "blog#index"
  get "press"         => "press#index"
end
