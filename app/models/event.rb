class Event < ApplicationRecord
  belongs_to :category

  has_many :enrollments
  has_many :users, through: :enrollments

  validates: :title, presence: true, length: {minimum: 2}
  validates: :stats_at, presence: true
  validates: :ends_at, presence: true
  validates: :ends_at_greater_than_starts_at

  private 
  def ends_at_greater_than_starts_at
    if self.starts_at_present? && self.ends_at_present? && self.starts_at > self.ends_at
      errors.add(:starts_at )

    end 
  end
end
