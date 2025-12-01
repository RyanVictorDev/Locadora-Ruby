class UserService
    def initialize(user)
        @user = user
    end

    def create_user
        if @user.save
            { success: true, user: @user }
        else
            { success: false, errors: @user.errors.full_messages }
        end
    end
end