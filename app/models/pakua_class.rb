class PakuaClass < ApplicationRecord
  validates :day_of_week, :modality, :hour, :minutes, :duration, presence: true
  belongs_to :person, optional: true
  attribute :active, default: true
  validate :has_valid_instructor

  scope :active_classes , -> { where(active: true) }

  enum day_of_week: {
    segunda: 1,
    terca: 2,
    quarta: 3,
    quinta: 4,
    sexta: 5,
    sabado: 6,
    domingo: 7
  }

  enum modality: {
    acrobacia: 1,
    armas_de_corte: 2,
    arqueria: 3,
    arte_marcial: 4,
    ritmos: 5,
    tai_chi: 6,
    yoga: 7
  }

  def end_of_class
    #Time.new(hour: hour, minute
  end

  def class_description
    modality_name + ' - ' + day_of_week_name + ' de ' + hour + ':' + minutes + ' até ' + (Time.new())
  end

  private
  def has_valid_instructor
    return true if self.person.blank?

    unless Person.instructors_of(self.modality).include?(self.person)
      errors.add(:person, "instrutor(a) inválido(a)")
    end
  end
end
