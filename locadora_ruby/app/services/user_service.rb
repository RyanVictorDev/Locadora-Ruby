class UserService
    def initialize(user)
        @user = user
    end

    def create
        user =  User.new(@user)
        if user.save
            return { success: true, user: user }
        else
            return { success: false, errors: user.errors.full_messages }
        end
    end
end