class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.boolean :public, null: false, default: false
      t.string :description, null: false
      t.string :group, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.references :teacher, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
