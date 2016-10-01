class Report < ApplicationRecord
  has_many :occurrences, dependent: :destroy
  has_many :tasks, -> { distinct }, through: :occurrences
  validates_presence_of :started_at

  def duration
    9.hours
  end

  def occurrence_duration
    15.minutes
  end

  def possible_occurrences(task, report_duration = self.duration)
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
      end_time = started_at + report_duration
      possibilites = []
      while stepper < end_time
        logger.debug("stepper: #{stepper}")
        occurrence = occurrences.where(task: task, started_at: stepper, duration: occurrence_duration).first_or_initialize
        logger.debug("occurence: #{occurrence.new_record?}")
        possibilites << occurrence
        stepper += occurrence_duration
      end
      possibilites
    # end
  end

  def self.with_start_time(start_hour=9)
    Report.new({
      started_at: DateTime.current.change({ hour: start_hour })
    })
  end
end
