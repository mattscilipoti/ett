class Report < ApplicationRecord
  validates :started_at, presence: true, uniqueness: true

  def duration_human
    ChronicDuration.output(duration)
  end

  def duration_human=(value)
    self.duration = ChronicDuration.parse(value)
  end

  def ended_at
    started_at + duration
  end

  def occurrences
    Occurrence.within_range(started_at, ended_at)
  end

  def occurrence_duration_human
    ChronicDuration.output(occurrence_duration)
  end

  def occurrence_duration_human=(value)
    self.occurrence_duration = ChronicDuration.parse(value)
  end

  def merged_occurrences(task)
    # merge a hash of possible occurrences and actual occurrences, keyed on started_at
    occurrences_within_range_with_task = occurrences.where(task: task).index_by(&:started_at)
    possible_occurrences = possible_occurrences(task).index_by(&:started_at)
    possible_occurrences.merge(occurrences_within_range_with_task)
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
    end # rubocop:disable

    # @possible_occurrences ||= begin
      stepper = started_at
      end_time = started_at + self.duration
      possibilites = []
      while stepper < end_time
        occurrence = task.occurrences.build(started_at: stepper, duration: occurrence_duration)
        possibilites << occurrence
        stepper += occurrence_duration
      end
      possibilites
    # end
  end

  def tasks
    occurrences.collect(&:task).uniq.sort_by(&:name)
  end

  def self.with_start_time(start_hour=9)
    start_of_work_day = Time.current.beginning_of_day.change({ hour: start_hour })
    Report.find_or_create_by!({
      started_at: start_of_work_day
    })
  end
end
