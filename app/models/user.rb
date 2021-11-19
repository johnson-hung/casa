class User < ActiveRecord::Base
    has_many :user_events
    has_many :events, through: :user_events
    
    # adds virtual attributes for authentication
    has_secure_password
    
    # validation
    validates :account_name, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
end
