class CreateUserPassedEssays < ActiveRecord::Migration[7.1]
  def change
    create_table :user_passed_essays do |t|
      t.string :answer
      t.references :user, foreign_key: true, null: false
      t.references :essay, foreign_key: true, null: false

      t.timestamps
    end
  end
end
