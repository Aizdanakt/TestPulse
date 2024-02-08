# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_06_132641) do
  create_table 'answers', force: :cascade do |t|
    t.string 'body', null: false
    t.boolean 'correct', default: false, null: false
    t.integer 'question_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'questions', force: :cascade do |t|
    t.string 'body', null: false
    t.integer 'test_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['test_id'], name: 'index_questions_on_test_id'
  end

  create_table 'tasks', force: :cascade do |t|
    t.string 'title', null: false
    t.boolean 'public', default: false, null: false
    t.integer 'teacher_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['teacher_id'], name: 'index_tasks_on_teacher_id'
  end

  create_table 'tests', force: :cascade do |t|
    t.string 'title', null: false
    t.integer 'level', default: 0, null: false
    t.integer 'tests', default: 10
    t.integer 'time_limit', default: 10
    t.integer 'category_id', null: false
    t.integer 'author_id', null: false
    t.integer 'task_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_tests_on_author_id'
    t.index ['category_id'], name: 'index_tests_on_category_id'
    t.index ['task_id'], name: 'index_tests_on_task_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'type', default: 'User', null: false
    t.string 'group'
    t.integer 'teacher_id'
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['type'], name: 'index_users_on_type'
  end

  add_foreign_key 'answers', 'questions'
  add_foreign_key 'questions', 'tests'
  add_foreign_key 'tasks', 'users', column: 'teacher_id'
  add_foreign_key 'tests', 'categories'
  add_foreign_key 'tests', 'tasks'
  add_foreign_key 'tests', 'users', column: 'author_id'
end
