class AddIndexForOccurrencePossibleOccurrences < ActiveRecord::Migration[5.0]
  def change
    add_index :occurrences, [:report_id, :task_id, :started_at, :duration], unique: true, name: 'possible_occurrences'
  end
end
