class User < ApplicationRecord
    has_many :enrollments
    has_many :events, through: :enrollments
    
    validates :name, presence: true, length: { minimum: 2 }
    validates :email, presence: true,  uniqueness: true, email: true

    before_save :normalize_name, if:  Proc.new { |user| user.name_changed? }

    private

    def normalize_name
        self.name.gsub! /[^\w\s]/, ''
    end
end
