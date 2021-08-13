module ApplicationHelper

  def date_to_string(date)
    return '' if date.nil?

    date.strftime('%d-%m-%Y')
  end

  def weekly_classes(quantity)
    quantity.zero? ? 'Plano Livre' : quantity
  end

  def to_money(cash)
    str_cash = cash.to_s
    puts ((cash % 1) * 10) % 1
    str_cash += '0' if (((cash % 1) * 10) % 1).zero?
    "R$ #{str_cash.gsub!('.', ',')}"
  end

  def date_format(date)
    date.strftime('%d/%m/%Y')
  end
end
