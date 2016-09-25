class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.datetime :started_at, null: false
      t.string :memo

      t.timestamps
    end
  end
end
