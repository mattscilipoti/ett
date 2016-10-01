class Report < ApplicationRecord
  has_many :occurrences, dependent: :destroy
  has_many :tasks, -> { distinct }, through: :occurrences
  validates :started_at, presence: true, uniqueness: true

  def duration
    3.hours
  end

  def ended_at
    started_at + duration
  end

  def occurrence_duration
    15.minutes
  end

  def merged_occurrences(task)
    # merge a hash of possible occurrences and actual occurrences, keyed on started_at
    occurrences_within_range = occurrences.within_range(task, started_at, ended_at).index_by(&:started_at)
    possible_occurrences = possible_occurrences(task).index_by(&:started_at)
    possible_occurrences.merge(occurrences_within_range)
  end

  def possible_occurrences(task)
    # logger.debug("po.task: #{task}")
    task = case task
    when String
      Task.find_or_initialize_by(name: task)
    when Task
      task
    else
      fail ArgumentError.new("Unsupported task type (#{task}).")
    end

    # @possible_occurrences ||= begin
      stepper = started_at
      end_time = started_at + self.duration
      possibilites = []
      while stepper < end_time
        occurrence = occurrences.build(task: task, started_at: stepper, duration: occurrence_duration)
        possibilites << occurrence
        stepper += occurrence_duration
      end
      possibilites
    # end
  end

  def self.with_start_time(start_hour=9)
    start_of_work_day = Time.current.beginning_of_day.change({ hour: start_hour })
    Report.find_or_create_by!({
      started_at: start_of_work_day
    })
  end
end
