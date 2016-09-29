class Report < ApplicationRecord
  has_many :occurrences
  has_many :tasks, through: :occurrences
  validates_presence_of :started_at

  def occurrence_duration
    15.minutes
  end

  def possible_occurrences(task)
    task = case task
    when String
      Task.new(name: task)
    when Task
      task
    else
      fail ArgumentError.new("Unsupported task type (#{task}).")
    end

    @possible_occurrences ||= begin
      stepper = started_at
      end_time = started_at + 9.hours
      possibilites = []
      while stepper < end_time
        possibilites << occurrences.build(task: task, started_at: stepper, duration: occurrence_duration)
        stepper += occurrence_duration
      end
      possibilites
    end
  end

  def self.with_start_time(start_hour=9)
    Report.new({
      started_at: DateTime.current.change({ hour: start_hour })
    })
  end
end
