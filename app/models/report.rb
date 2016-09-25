class Report < ApplicationRecord
  after_initialize :set_defaults
  validates_presence_of :started_at

  def first_hour
    9
  end

  def start_time
    self.started_at.to_time
  end


  private

  def set_defaults
    if self.new_record?
      self.started_at ||= DateTime.current.change({ hour: first_hour })
    end
  end
end
