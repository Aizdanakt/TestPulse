class Task < ApplicationRecord
  belongs_to :teacher

  scope :by_teacher, ->(teacher) { where(teacher_id: teacher.id) }
end
