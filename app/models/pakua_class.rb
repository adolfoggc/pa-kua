class PakuaClass < ApplicationRecord
  validates :day_of_week, :modality, :hour, :minutes, :duration, presence: true

  enum day_of_week: {
    domingo: 0,
    segunda: 1,
    terca: 2,
    quarta: 3,
    quinta: 4,
    sexta: 5,
    sabado: 6
  }

  enum modality: {
    acrobacia: 1,
    armas_de_corte: 2,
    arqueria: 3,
    arte_marcial: 4,
    ritmo: 5,
    tai_chi_pa_kua: 6,
    yoga: 7
  }

  def end_of_class
    #Time.new(hour: hour, minute
  end

  def class_description
    modality_name + ' - ' + day_of_week_name + ' de ' + hour + ':' + minutes + ' até ' + (Time.new())
  end
end
