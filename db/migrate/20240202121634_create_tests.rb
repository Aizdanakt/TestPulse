class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :time_limit, null: false, default: 10
      t.integer :attempts, null: false, default: 1
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
