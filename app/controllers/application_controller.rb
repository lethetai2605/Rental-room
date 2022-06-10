# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to '/'
  end
  def current_ability
    @current_ability ||= Ability.new(current_account)
  end

  protected

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end
end
