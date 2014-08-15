class UsersController < ApplicationController

  def show
    #This will give instance variables. Page will display user details and also all his posts.
    @user = current_user
    if @user.profile_picture == ""
      @picture = "/public/uploads/user-default-blue.png"
    else
      @picture = @user.profile_picture
    end
  end

def update

end
  def complaints
    @user = current_user
    @posts = Post.where("user_id = ?", current_user.id)
  end

end
