class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def layout_by_resource
    if  (controller_name == 'home' && action_name == 'welcome') || (devise_controller? && resource_name == :user && action_name == 'new')
      'landing'
    else
      'application'
    end
  end
end
