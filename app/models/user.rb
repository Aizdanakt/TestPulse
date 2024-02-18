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

  def user_uniq_tasks
    tests = Test.joins(:user_passed_tests).where(user_passed_tests: { user_id: id }).distinct
    task_ids = tests.pluck(:task_id).uniq


    Task.where(id: task_ids)
  end

  def user_passed_tests_by_task(task)
    user_passed_tests.where(test_id: task.tests)
  end

  def user_passed_essays_by_task(task)
    user_passed_essays.where(essay_id: task.essays)
  end

end
