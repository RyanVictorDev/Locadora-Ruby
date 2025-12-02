class Publisher < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :site, presence: false
    validates :is_deleted, inclusion: { in: [true, false] }
end
