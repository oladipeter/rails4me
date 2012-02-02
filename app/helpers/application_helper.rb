module ApplicationHelper

  def capitalized_the_text(text)
    cap_text = text.capitalize!
  end

  def truncate_the_text(text, length)
    truncated_text = truncate(text, :length => length)
  end

end
