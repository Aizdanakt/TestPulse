module StudentsHelper

  def views_answer(answer, passed_test, question)
    color_class_primary = 'text-primary'
    color_class_success = 'text-success'
    color_class_danger = 'text-danger'
    answers_body = answer.body

    if passed_test.answers_data[question.id.to_s]&.include?(answer.id.to_s) && answer.correct
      "<span class=#{color_class_success}>#{answers_body}✔</span><br>".html_safe
    elsif passed_test.answers_data[question.id.to_s]&.include?(answer.id.to_s)
      "<span class=#{color_class_danger}>#{answers_body}</span><br>".html_safe
    elsif answer.correct
      "<span class=#{color_class_primary}>#{answers_body}</span><br>".html_safe
    else
      "<span>#{answers_body}</span><br>".html_safe
    end
  end
end
