class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

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
end
