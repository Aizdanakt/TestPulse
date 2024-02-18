class Task < ApplicationRecord
  belongs_to :teacher, class_name: 'User'

  has_many :tests, dependent: :destroy
  has_many :essays, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  scope :by_teacher, ->(teacher) { where(teacher_id: teacher.id) }
end
