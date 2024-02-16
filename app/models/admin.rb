class Admin < User
  has_many :tasks

  def students
    User.where(teacher_id: id)
  end
end
