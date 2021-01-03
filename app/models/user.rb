class User < ApplicationRecord
    has_many :articles
    has_many :tags
    
    validates :username, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 255}
    has_secure_password
end
