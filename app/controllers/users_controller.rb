class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    if verify_recaptcha
      @user = User.new(params[:user])
      @user.user_groups << UserGroup.find_by_name("Users")
      if @user.save
        add_lockdown_session_values
        flash[:notice] = "Account registered!"
        redirect_to root_path
      else
        redirect_to new_user_path
      end
    else
      redirect_to new_user_path
    end
  end
  
  def show
    @user = @current_user
  end
 
  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to root_url
    else
      render :action => :edit
    end
  end
end
