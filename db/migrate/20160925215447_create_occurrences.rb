class CreateOccurrences < ActiveRecord::Migration[5.0]
  def change
    create_table :occurrences do |t|
      t.belongs_to :report, foreign_key: true
      t.belongs_to :task, foreign_key: true
      t.datetime :started_at, null: false
      t.integer :duration, null:false, default: (15 * 60)

      t.timestamps
    end
  end
end
