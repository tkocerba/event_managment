class Event < ApplicationRecord
  belongs_to :category

  has_many :enrollments
  has_many :users, through: :enrollments

  validates :title, presence: true, length: {minimum: 2}, uniqueness: {scope: :category}
  }
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  validate :ends_at_greater_than_starts_at

  private 
    def ends_at_greater_than_starts_at
      if self.starts_at.present? && self.ends_at.present? && self.starts_at > self.ends_at
        self.errors.add(:starts_at, 'Should be earlier than the ending time')
        self.errors.add(:ends_at, 'Should be later than the starting time')
      end
    end
end
