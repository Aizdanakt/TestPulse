class CreateEssays < ActiveRecord::Migration[7.1]
  def change
    create_table :essays do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :time_limit, default: 10
      t.string :image_url
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
