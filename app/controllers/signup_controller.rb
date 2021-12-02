class SignupController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    @research_interest_users = ResearchInterestUser.new(user_id = @user_id , research_interest_ids = params[:research_interest_ids])
    @research_interest_users.save 
    
    
    if @user.valid?
    # stores saved user id in a session
      @user.save
      redirect_to root_path, notice: 'Successfully created account'
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:account_name, :password, :password_confirmation, :first_name, :last_name, :organization, :email, :phone, :mentor, :mentee, research_interest_ids:[])
  end
end
