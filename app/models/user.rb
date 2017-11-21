class User < ApplicationRecord
    has_many :enrollments
    has_many :events, through: :enrollments
    
    validates :name, presence: true, length: {minimum: 2}
    validates :email, presence: true,  uniqueness: true, email: true
end
