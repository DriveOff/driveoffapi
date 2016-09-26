class ApplicationController < ActionController::Base
  include Pundit
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers
  
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'accept, content-type, X-Requested-With, X-Prototype-Version, X-CSRF-Token, authorization'
    headers['Access-Control-Allow-Credentials'] = true
  end
  
  def cors_preflight_check
    if request.method == :options
      
      Access-Control-Allow-Origin
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'accept, content-type, X-Requested-With, X-Prototype-Version, X-CSRF-Token, authorization'
      headers['Access-Control-Allow-Credentials'] = true
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end
  
  def raise_404
    raise ActionController::RoutingError.new("Not found")
  end
  
  def user_not_authorized(exception)
    raise ActionController::RoutingError.new("Forbidden")
  end
end