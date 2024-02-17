class Essay < ApplicationRecord
  belongs_to :task

  has_many :user_passed_essays, dependent: :destroy
  has_many :users, through: :user_passed_essays

  validates :title, presence: true
  validates :description, presence: true

  def deadline_passed?
    time = Time.current
    task.end_time <= time && task.start_time >= time
  end

  def attempts_over?
    attempts.zero?
    false
  end
end
