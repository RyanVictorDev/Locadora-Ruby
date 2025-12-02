class User < ApplicationRecord
    has_secure_password

    enum :role, {
        admin: "admin",
        user:  "user"
    }

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 4 }, if: -> { password.present? }
end
