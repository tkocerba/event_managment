class User < ApplicationRecord
  has_many :enrollments
  has_many :events, through: :enrollments
  
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true,  uniqueness: true, email: true

  before_save :normalize_name, if:  Proc.new { |user| user.name_changed? }
  before_create :normalize_email

  has_secure_password

  def self.from_email_password(email, password) 
    user = self.find_by(email: email.downcase)
    user && user.authenticate(password)
  end

  private

  def normalize_name
    self.name.gsub! /[^\w\s]/, ''
  end

  def normalize_email
    self.email.downcase!
  end
end
