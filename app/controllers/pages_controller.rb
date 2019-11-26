class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  params.require(:user).permit(:first_name, :last_name, :email, :password, :photo)
  def home
  end
end
