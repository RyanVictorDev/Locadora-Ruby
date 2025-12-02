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

    def update(existing_user)
        if existing_user.update(@user)
            return { success: true, user: existing_user }
        else
            return { success: false, errors: existing_user.errors.full_messages }
        end
    end
end