class Task < ApplicationRecord
  belongs_to :teacher, class_name: 'User'

  has_many :tests, dependent: :destroy
  has_many :essays, dependent: :destroy

  scope :by_teacher, ->(teacher) { where(teacher_id: teacher.id) }

  # def tasks_by_student(student)
  #   tests = Test.joins(:user_passed_tests).where(user_passed_tests: { user_id: student.id }).distinct
  #   task_ids = tests.pluck(:task_id).uniq
  #
  #   Task.where(id: task_ids)
  # end



end
