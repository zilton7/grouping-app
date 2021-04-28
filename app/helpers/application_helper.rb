module ApplicationHelper
  def error_messages(obj)
    if obj.errors.full_messages.any?
      obj.errors.full_messages.each do |error_message|
          return content_tag :p, error_message, class: 'text-danger text-center' if obj.errors.full_messages.first == error_message
      end
    end
  end
end
