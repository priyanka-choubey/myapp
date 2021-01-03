class User < ApplicationRecord
    has_many :articles
    has_many :tags
    
    validates :username, presence: true, length: {maximum: 50},  uniqueness: true,
    format:  {with:  URI::MailTo::EMAIL_REGEXP}
    validates :email, presence: true, length: {maximum: 255}, uniqueness: true
    has_secure_password
end
