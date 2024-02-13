class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: false
      t.integer :time_limit, default: 10
      t.string :image_url
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
