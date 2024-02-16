module FlashHelper

  def display_flash_messages
    flash.map do |type, message|
      content_tag :div, class: "flash #{type}", role: 'alert', id: 'flash' do
        concat icon_for_flash(type)
        concat message.html_safe
      end
    end.join.html_safe
  end

  def icon_for_flash(type)
    case type
    when 'error'
      content_tag(:i, '', class: 'fas fa-times-circle')
    when 'success'
      content_tag(:i, '', class: 'fas fa-check-circle')
    when 'alert'
      content_tag(:i, '', class: 'fas fa-exclamation-triangle')
    when 'notice'
      content_tag(:i, '', class: 'fas fa-info-circle')
    else
      ''
    end
  end
end
