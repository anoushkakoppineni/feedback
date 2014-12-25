class UsersController < ApplicationController
  before_action :set_user,only: [:show,:edit,:update]
  def show
    #This will give instance variables. Page will display user details and also all his posts.
  end

  def update
     if current_user.nil?
      redirect_to root_path
    end  
      @user.nick = params[:user][:nick]
      @user.room = params[:user][:room]
      @user.hostel = params[:user][:hostel]
      @user.email = params[:user][:email]
      @user.contact = params[:user][:contact]
      @user.avatar = params[:user][:avatar]
      if @user.save
	  flash[:success]="User Profile updated successfully"
          redirect_to @user
      else
      	  render :edit
      end
  end

  def edit
  end

  def complaints
    @user = current_user
    @posts = Post.where("user_id = ?", current_user.username)
  end
  private
    def set_user
      if current_user.nil?
        redirect_to root_path
       
      else
      @user = current_user
      if @user.profile_picture == ""
        @picture = "user-default-blue.png"
      else
        @picture = @user.profile_picture
      end
    end
    end

    def user_params 
      params.require(:user).permit(:nick,:room,:hostel,:email,:contact,:avatar)
    end
  end
