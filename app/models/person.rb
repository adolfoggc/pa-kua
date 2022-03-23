class Person < ApplicationRecord
  encrypts :name, :address, :cpf, :phone, :occupation, :other_option, :cep, :email
  encrypts :birthdate, :start_date, type: :date
  encrypts :school_level, :status, :civil_status, :marketing, type: :integer
  blind_index :birthdate, :start_date, :school_level, :status, :civil_status, :marketing

  validates :name_ciphertext, :address_ciphertext, :phone_ciphertext, :cpf_ciphertext, :role, presence: true

  has_many :student_plans
  has_many :payments, through: :student_plans
  has_many :belts

  attribute :role, :integer, default: :student
  attribute :status, :integer, default: :not_checked

  enum role: {
    student: 1,
    open_class_student: 2,
    student_and_instructor: 3,
    instructor: 4,
    traveling_instructor: 5
  }

  enum school_level: {
    ensino_fundamental: 1,
    ensino_medio: 2,
    ensino_superior: 3
  }

  enum civil_status: {
    solteiro: 1,
    casado: 2,
    viuvo: 3,
    divorciado: 4
  }

  enum status: {
    not_checked: 0,
    open_class: 1,
    active: 2,
    inactive: 3
  }

  enum marketing: {
    recommendation: 0,
    google: 1,
    facebook: 2,
    instagram: 3,
    flyer: 4,
    other: 5
  }

  def pakua_student?
    student? || student_and_instructor?
  end

  def pakua_instructor?
    instructor? || student_and_instructor? || traveling_instructor?
  end

  def role_br
    if student?
      'Aluno(a)'
    elsif open_class_student?
      'Aluno(a) de aula Inaugural'
    elsif student_and_instructor?
      'Aluno(a) e Instrutor(a)'
    elsif instructor?
      'Instrutor(a)'
    else
      'Instrutor(a) Itineirante'
    end
  end

  def greatest_belt_color
    return '' if belts.blank?

    belts.select(:color).group(:color).order(:color).uniq.last.color
  end

  # student methods
  def latest_student_plan
    student_plans.order(:created_at).last
  end

  # instructor methods
  def can_be_instructor_of(modality)
    belts.where('5 <= color').where(modality: modality)
  end

  def can_be_instructor?
    belts.where('5 <= color').any?
  end

  def student_level_translation
    if self.ensino_fundamental
      'Ensino Fundamental'
    elsif self.ensino_medio
      'Ensino Médio'
    else
      'Ensino Superior'
    end
  end


end
