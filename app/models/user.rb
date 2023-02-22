class User < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :gender, presence: true
  validate :gender_valid

  def gender_valid
    return if %w[male female non-binary].include?(gender)

    errors.add(:gender, 'must be male, female, or non-binary')
  end
end