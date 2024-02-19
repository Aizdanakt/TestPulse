class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :user_passed_tests, dependent: :destroy
  has_many :tests, through: :user_passed_tests

  has_many :user_passed_essays, dependent: :destroy
  has_many :essays, through: :user_passed_essays

  has_many :created_tasks, class_name: 'Task', foreign_key: 'teacher_id', dependent: :destroy

  validates :name, presence: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def admin?
    is_a?(Admin)
  end

  def teacher?
    is_a?(Teacher)
  end

  def user_passed_test(test)
    user_passed_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def user_passed_essay(essay)
    user_passed_essays.order(id: :desc).find_by(essay_id: essay)
  end

  def user_uiq_tasks
    tests = Test.joins(:user_passed_tests).where(user_passed_tests: { user_id: id }).distinct
    task_ids = tests.pluck(:task_id).uniq


    Task.where(id: task_ids)
  end

  def user_uniq_tasks
    test_task_ids = task_ids_for_passed_tasks(Test, :user_passed_tests)
    essay_task_ids = task_ids_for_passed_tasks(Essay, :user_passed_essays)
    task_ids = (test_task_ids + essay_task_ids).uniq

    Task.where(id: task_ids)
  end

  def user_passed_tests_by_task(task)
    user_passed_tests.where(test_id: task.tests)
  end

  def user_passed_essays_by_task(task)
    user_passed_essays.where(essay_id: task.essays)
  end

  private

  def task_ids_for_passed_tasks(model, association_name)
    model.joins(association_name)
         .where(association_name => { user_id: id })
         .distinct
         .pluck(:task_id)
         .uniq
  end
end
