class UserPassedEssay < ApplicationRecord
  belongs_to :user
  belongs_to :essay

  def time_left
    elapsed_time = (Time.current - created_at).to_i
    remaining_time = (essay.time_limit * 60) - elapsed_time
    remaining_time.positive? ? remaining_time : 0
  end

  def elapsed_time
    time_difference = updated_at - created_at
    minutes = (time_difference / 60).to_i
    seconds = (time_difference % 60).to_i
    "#{minutes} минут: #{seconds} секунд"
  end
end
