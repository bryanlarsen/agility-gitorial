class UsersController < ApplicationController

  hobo_user_controller

  auto_actions :all, :except => [ :index, :new, :create ]

  def do_signup
    hobo_do_signup do
      if this.errors.blank?
        flash[:notice] << "You must activate your account before you can log in.  Please check your email."
      end
    end
  end  

end
