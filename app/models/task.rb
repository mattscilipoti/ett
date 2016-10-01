class Task < ApplicationRecord
  has_many :occurrences, dependent: :destroy
  has_many :reports, through: :occurrences
  validates :name, presence: true, uniqueness: true
end
