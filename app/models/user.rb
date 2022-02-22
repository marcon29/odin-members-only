class User < ApplicationRecord
    has_many :posts
    validates :first_name, :last_name,  presence: true
    validates :username, :email, presence: true, uniqueness: true
    # validates :password_digest

end

