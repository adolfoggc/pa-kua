module ApplicationHelper

  def date_to_string(date)
    return '' if date.nil?

    date.strftime('%d-%m-%Y')
  end

  def weekly_classes(quantity)
    quantity.zero? ? 'Plano Livre' : quantity
  end

  def to_br(value)
    str_value = value.to_s
    puts ((value % 1) * 10) % 1
    str_value += '0' if (((value % 1) * 10) % 1).zero?
    str_value.gsub!('.', ',')
  end

  def to_money(cash)
    "R$ #{to_br(cash)}"
  end

  def to_percent(value)
    "#{to_br(value)}%"
  end

  def date_format(date)
    date.strftime('%d/%m/%Y')
  end

  def text_or_none(text)
    return '-' if text.nil?

    text
  end

  def logic_to_br(value)
    value == 'true' ? 'Sim' : 'Não'
  end

  def br_month(month)
    months_hash = { '1': 'janeiro', '2': 'fevereiro', '3': 'março',
                    '4': 'abril', '5': 'maio', '6': 'junho', '7': 'julho',
                    '8': 'agosto', '9': 'setembro', '10': 'outubro',
                    '11': 'novembro', '12': 'dezembro' }
    months_hash[month.to_s.to_sym].capitalize
  end
end
