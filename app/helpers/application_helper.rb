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

  def belt_color_style(color)
    case color
    when 'branca'
      'background-color:white !important; color: black !important; border: 1px black solid;'
    when 'amarela'
      'background-color:yellow !important; color: black !important; border: 1px black solid;'
    when 'laranja'
      'background-color:orange !important; color: white !important; border: 1px orange solid;'
    when 'verde'
      'background-color:green !important; color: white !important; border: 1px green solid;'
    when 'cinza'
      'background-color:gray !important; color: white !important; border: 1px gray solid;'
    when 'azul'
      'background-color:blue !important; color: white !important; border: 1px blue solid;'
    when 'vermelha'
      'background-color:red !important; color: white !important; border: 1px red solid;'
    else
      'background-color:black !important; color: white !important; border: 1px black solid;'
    end
  end

  def belt_color_name(color)
    return color.humanize unless color.humanize.include?(' ')

    color = color.humanize.split
    color[0].capitalize + ' ' + color[1].upcase
  end

  def modality_name(modality)
    modality = modality.humanize
    return modality unless modality.include?(' ')

    modality = modality.split
    modality_name = ''
    modality.each do |m|
      modality_name += m.capitalize + ' '
    end
    modality_name
  end

  def pakua_title(person)
    return 'instrutor' if person.pakua_instructor?

    'aluno'
  end

  def day_of_week_name(day)
    return day.capitalize unless %w[terca sabado].include? day

    if day == 'terca'
      'Terça'
    else
      'Sábado'
    end
  end
end
