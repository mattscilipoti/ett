class Task < ApplicationRecord
  has_many :occurrences
  has_many :reports, through: :occurrences
  validates_presence_of :name
end
