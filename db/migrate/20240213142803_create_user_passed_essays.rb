class CreateUserPassedEssays < ActiveRecord::Migration[7.1]
  def change
    create_table :user_passed_essays do |t|
      t.string :answer, null: false
      t.integer :essay_min_length, default: 50
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false

      t.timestamps
    end
  end
end
