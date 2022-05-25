class ProfilesController < ApplicationController
  before_action :authenticate_account!
  before_action :set_profile
  load_and_authorize_resource

  def update
    if @account.profile.update(profile_params)
      redirect_to account_path(current_account), notice: "Profile was successfully updated."
    else
      redirect_to account_path(current_account), alert: "Invalid input!"
    end
  end

  private
  def set_profile
    @account = Account.find(current_account.id)
  end

  def profile_params
    params.require(:profile).permit(:name, :phone, :address, :dob, :gender, :avatar)
  end
end

