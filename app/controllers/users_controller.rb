class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
	attr_accessor :name, :email, :password

def show
	@user = User.find(params[:id])
end

def edit
  @user = User.find(params[:id])
end

  def new
  	@user = User.new
  end
  
  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App"
  		redirect_to @user
  	else
  		render 'new'
  	end
 end

 def update
  @user = User.find(params[:id])
  if @user.update_attributes(params[:user])
    flash[:succes] = "Profile updated"
    sign_in @user
    redirect_to @user
  else
    render 'edit'
  end
 end

def index
   @users = User.paginate(page: params[:page], :per_page => 30)
 end

 def destroy
  User.find(params[:id]).destroy
  redirect_to users_path
end

 private

 def admin_user
  redirect_to(root_path) unless current_user.admin?
end

def signed_in_user
   unless signedin?
    store_location
    redirect_to signin_path, notice: "Please sign in."
end
end

def correct_user
  @user = User.find(params[:id])
  redirect_to(root_path) unless current_user?(@user)
end

end
   