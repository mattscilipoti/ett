class OccurrenceOnlyBelongsToTask < ActiveRecord::Migration[5.0]
  def change
    remove_column :occurrences, :report_id, :integer, foreign_key: true
  end
end
