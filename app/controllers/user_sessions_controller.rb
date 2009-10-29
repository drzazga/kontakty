class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      add_lockdown_session_values
      flash[:notice] = "Successfully created user session."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    #@user_session = UserSession.find
    #@user_session.destroy
    if current_user
      current_user_session.destroy
      reset_lockdown_session
      flash[:notice] = "Successfully destroyed user session."
    end
    redirect_to root_url
  end
  
  private

  def set_lockdown_values
    if user = @user_session.user
      add_lockdown_session_values(user)
    end
  end
  
  
end
