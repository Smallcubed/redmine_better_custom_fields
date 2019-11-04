# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
  match 'better/custom_fields', :controller => 'redmine_better_custom_fields', :action => 'index', :via => [:get]
  match 'better/issue_transitions', :controller => 'redmine_better_issue_transitions', :action => 'index', :via => [:get]
