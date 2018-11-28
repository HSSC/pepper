module MessagesHelper
  def uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end

  def modal_body help_text
    if uri?(help_text)
      content_tag :img, '', src: help_text, class: 'modal-image'
    else
      help_text
    end
  end
end
