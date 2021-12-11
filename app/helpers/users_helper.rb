module UsersHelper
    def is_organizer
        if current_user and current_user.organization == 1
            return true
        end
        
        return false
    end
end
