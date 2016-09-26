class Report < ApplicationRecord
  has_many :occurrences
  has_many :tasks, through: :occurrences
  validates_presence_of :started_at

  def self.with_start_time(start_hour=9)
    Report.new({
      started_at: DateTime.current.change({ hour: start_hour })
    })
  end
end
