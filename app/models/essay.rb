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

  def attempts_over?(user)
    user_passed_essay_count = user_passed_essays.where(user: user).count

    (attempts - user_passed_essay_count) <= 0
  end
end
