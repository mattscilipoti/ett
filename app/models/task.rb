class Task < ApplicationRecord
  has_many :occurrences, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
