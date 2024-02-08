class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :user_passed_tests, dependent: :destroy
  has_many :tests, through: :user_passed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
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

  def user_tests_by_level(level)
    tests.where(level: level)
  end
end
