class User < ApplicationRecord
    has_secure_password
    has_many :lists
    has_many :tasks, through: :lists

    validates :email, presence: true
    validates :email, uniqueness: true 

    def self.from_omniauth(auth)
        where(uid: auth.uid).first_or_create do |user|
            user.first_name = auth.info.first_name
            user.uid = auth.uid
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end
    
end
