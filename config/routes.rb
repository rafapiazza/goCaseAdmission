Rails.application.routes.draw do
  namespace 'api' do
#using resources to track routes
  	resources :survivors do
  	end
#using manually
#  	get 'reports/abducted'
#  	get 'reports/nonabducted'
  	get 'reports/all'

 
  end

  
end
