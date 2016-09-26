class Occurrence < ApplicationRecord
  belongs_to :report
  belongs_to :task

  validates_presence_of :started_at
  validates :duration, # a positive integer
    presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0
    }
end
