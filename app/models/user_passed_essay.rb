class UserPassedEssay < ApplicationRecord
  belongs_to :user
  belongs_to :essay

  def time_left
    elapsed_time = (Time.current - created_at).to_i
    remaining_time = (essay.time_limit * 60) - elapsed_time
    remaining_time.positive? ? remaining_time : 0
  end
end
