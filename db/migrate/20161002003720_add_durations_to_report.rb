class AddDurationsToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :duration, :integer, null: false, default: 9.hours
    add_column :reports, :occurrence_duration, :integer, null:false, default: 15.minutes
  end
end
