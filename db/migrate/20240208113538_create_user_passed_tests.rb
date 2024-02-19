class CreateUserPassedTests < ActiveRecord::Migration[7.1]
  def change
    create_table :user_passed_tests do |t|
      t.integer :correct_questions, default: 0
      t.json :answers_data, null: false, default: {}
      t.boolean :completed, null: false, default: false

      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false
      t.references :current_question, foreign_key: { to_table: :questions }

      t.timestamps
    end
  end
end
