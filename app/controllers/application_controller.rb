class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to '/'
  end
  def current_ability
    @current_ability ||= Ability.new(current_account)
  end
end
