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

  #page generators
  def page_title_with_button(title, button)
    
    html = ['<div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">', 
            title, '</h1>']

    html << '<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>' if button
    html << '</div>'
    html.join()
  end

  def generate_card(title, icon_style, value, link, color_style)
    html = ['<div class="col-xl-3 col-md-6 mb-4"><div class="card border-left-']
    html << color_style 
    html << ' shadow h-100 py-2"><div class="card-body"><div class="row no-gutters align-items-center">'
    html << '<div class="col mr-2"><div class="text-xs font-weight-bold text-'
    html << color_style
    html << ' text-uppercase mb-1">'
    html << title
    html << '</div><div class="h5 mb-0 font-weight-bold text-gray-800">'
    html << value
    html << '</div></div><div class="col-auto"><i class="'
    html << icon_style
    html << ' text-gray-300"></i></div></div></div></div></div>'
    html.join()
  end

end
