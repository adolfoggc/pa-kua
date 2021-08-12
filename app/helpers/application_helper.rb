module ApplicationHelper

  def date_to_string(date)
    return '' if date.nil?

    date.strftime("%d-%m-%Y")
  end
end
