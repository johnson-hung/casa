class UsersController < ApplicationController
    def new
        @user=User.new
    end
    

    def show 
        current_user
        if @current_user != nil
            @select_research_interest = @current_user.research_interest_ids
         end
    end 
             
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
    

    
end
