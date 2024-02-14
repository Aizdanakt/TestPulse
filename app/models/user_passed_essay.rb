class UserPassedEssay < ApplicationRecord
  belongs_to :user
  belongs_to :essay
end
