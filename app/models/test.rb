class Test < ApplicationRecord
  belongs_to :task

  has_many :questions, dependent: :destroy
  has_many :user_passed_tests, dependent: :destroy
  has_many :users, through: :user_passed_tests

  validates :title, presence: true

  def deadline_passed?
    time = Time.current
    task.end_time <= time && task.start_time >= time
  end

  def attempts_over?(user)
    user_passed_tests_count = user_passed_tests.where(user: user).count

    (attempts - user_passed_tests_count) <= 0
  end
end
