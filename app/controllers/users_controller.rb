class UsersController < ApplicationController
    def new
        @user=User.new
    end
    

    
    def edit
        current_user
        if @current_user != nil
            @select_research_interest = @current_user.research_interest_ids
        else
            flash.now[:alert] = @user.errors.full_messages
             render :edit
         end
    end
    
    def update
        current_user
        if @current_user.valid?
            if @current_user.update(user_params)
                redirect_to edit_user_path, notice: 'User information was successfully updated.'
            else
                render :edit
        
            end
         else
            flash.now[:alert] = @user.errors.full_messages
             render :edit
        end
      end
             
    
    
    private
  def user_params

    params.require(:user).permit(:account_name, :password, :password_confirmation, :first_name, :last_name, :organization, :email, :phone, :mentor, :mentee, research_interest_ids:[])
  end
    

    
end
