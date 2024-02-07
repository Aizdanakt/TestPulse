class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: false
      t.integer :tests, :time_limit, default: 10
      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
