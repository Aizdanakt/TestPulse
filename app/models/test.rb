class Test < ApplicationRecord
  belongs_to :task

  has_many :questions, dependent: :destroy
  has_many :user_passed_tests, dependent: :destroy
  has_many :users, through: :user_passed_tests

  validates :title, presence: true

end
