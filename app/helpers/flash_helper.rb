module FlashHelper

  def display_flash_messages
    flash.map do |type, message|
      content_tag :div, class: "flash #{type}", role: 'alert', id: 'flash' do
        concat message.html_safe
      end
    end.join.html_safe
  end
end
