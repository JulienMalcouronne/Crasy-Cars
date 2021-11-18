class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @user = current_user
  end

  def dashboard
    @user = current_user
    @reservations = @user.reservations
  end

end
