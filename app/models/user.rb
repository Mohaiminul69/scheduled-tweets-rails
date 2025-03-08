class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
    validates :password, presence: true, length: { minimum: 6 }
end