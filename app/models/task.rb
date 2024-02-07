class Task < ApplicationRecord
  belongs_to :teacher, class_name: 'User'

  has_many :tests, dependent: :destroy

  scope :by_teacher, ->(teacher) { where(teacher_id: teacher.id) }
end
