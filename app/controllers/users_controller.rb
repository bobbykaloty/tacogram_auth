class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["first_name"] = params["first_name"]
    @user["last_name"] = params["last_name"]
    @user["email"] = params["email"]
    # TODO: encrypt user's password "at rest"
    @user["password"] = BCrypt::Password.create(params["password"])
    @user.save
    session["user_id"] = @user["id"]
    redirect_to "/posts"
  end
end
