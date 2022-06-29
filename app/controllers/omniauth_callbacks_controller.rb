# frozen_string_literal: true

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    binding.pry
    generic_callback("facebook")
  end

  def google_oauth2
    generic_callback( "google_oauth2" )
  end

  def generic_callback(provider)
    @account = Account.from_omniauth(request.env["omniauth.auth"])
    if @account.persisted?
      sign_in_and_redirect @account, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_account_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
