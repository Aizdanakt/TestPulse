class Essay < ApplicationRecord
  belongs_to :task

  has_many :user_passed_essays, dependent: :destroy
  has_many :users, through: :user_passed_essays

  validates :title, presence: true
  validates :description, presence: true
end
