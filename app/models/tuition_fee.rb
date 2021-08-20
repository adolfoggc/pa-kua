class TuitionFee < ApplicationRecord
  validates :weekly_classes, :fee, :validity, presence: true

  def weekly_class_text
    return "#{weekly_classes} aulas semanais" unless weekly_classes.zero?

    return 'Plano Livre' if weekly_classes.zero?

    'Plano Inválido'
  end
end
