Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # You can have the root of your site routed with "root"
  root "home#index"
  get 'sitemap.xml', :to => 'sitemap#index', :defaults => {:format => 'xml'}

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  resources :academy_applications
  get "apply"         => "academy_applications#new"

  resources :enquiries
  get "enquire"       => "enquiries#new"

  resources :women_in_tech_scholarships
  get "women-in-tech/apply"   => "women_in_tech_scholarships#new"
  get "women-in-tech"         => "pages#women_in_tech_scholarship"

  resources :course_intakes

  resources :posts

  get "workshop-sessions"       =>  "workshop_dates#index"
  get "workshop-sessions/new"   =>  "workshop_attendees#new"
  resources :workshop_attendees
  resources :workshop_dates

  get "information-sessions"      => "info_session_dates#index"
  get "information-sessions/new"  => "info_session_attendees#new"
  resources :info_session_attendees
  resources :info_session_dates

  get "frequently-asked-questions"                => "pages#faq"
  get "curriculum"                                => "pages#curriculum"
  get "about-coder-factory-academy"               => "pages#about"
  get "about-coder-factory-academy/instructors"   => "pages#instructors"
  get "contact"                                   => "pages#contact"
  get "privacy"                                   => "pages#privacy"
  get "confirmation"                              => "pages#confirmation"
  get "vet-fee-help"                              => "pages#vet_fee_help"
  get "partners"                                  => "pages#partners"
  get "testimonials"                              => "pages#testimonials"
  get "video-archive"                             => "pages#video_archive"
  get "career-outcomes"                           => "pages#careers"

  get "blog"          => "blog#index"
  get "press"         => "press#index"

  get "update-spreadsheet"  => "update_spreadsheet#update"
end
