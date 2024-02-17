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

  def attempts_over?
    # attempts.zero?
    false
  end

end
