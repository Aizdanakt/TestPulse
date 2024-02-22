class Task < ApplicationRecord
  belongs_to :teacher, class_name: 'User'

  has_many :tests, dependent: :destroy
  has_many :essays, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  scope :by_teacher, ->(teacher) { where(teacher_id: teacher.id) }

  def formatted_time(time)
    time.strftime('%d.%m %H:%M')
  end

  def passed_or_not_started?
    time = Time.current
    end_time <= time || start_time >= time
  end

  def attempts_over?(user, association_name, attempts)
    user_passed_count = association_name.where(user: user).count

    (attempts - user_passed_count) <= 0
  end

end
