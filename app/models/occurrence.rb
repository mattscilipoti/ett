class Occurrence < ApplicationRecord
  belongs_to :task

  validates_presence_of :started_at
  validates :duration, # a positive integer
    presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0
    }

  def self.within_range(range_start, range_end)
    where('started_at >= :range_start and started_at < :range_end ', range_start: range_start, range_end: range_end)
  end

  def self.within_range_with_task(task, range_start, range_end)
    within_range(range_start, range_end).where(task: task)
  end

end
