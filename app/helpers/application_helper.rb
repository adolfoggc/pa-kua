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
    str_cash += '0' if cash%100 < 10
    "R$ #{str_cash.gsub!('.', ',')}"
  end
end
