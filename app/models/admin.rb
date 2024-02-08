class Admin < User

  def students
    User.where(teacher_id: id)
  end
end
