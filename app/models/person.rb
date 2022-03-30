class Person < ApplicationRecord
  encrypts :name, :address, :cpf, :phone, :occupation, :other_option, :cep, :email
  encrypts :birthdate, :start_date, type: :date
  encrypts :school_level, :status, :civil_status, :marketing, type: :integer
  blind_index :birthdate, :start_date, :school_level, :status, :civil_status, :marketing, :email, :cpf

  validates :name_ciphertext, :birthdate_ciphertext, :cpf_ciphertext, :school_level_ciphertext,
  :occupation_ciphertext, :civil_status_ciphertext, :email_ciphertext, 
  :cep_ciphertext, :address_ciphertext, :phone_ciphertext, :start_date_bidx, presence: true
  validates :cpf, uniqueness: true

  has_many :student_plans
  has_many :payments, through: :student_plans
  has_many :belts

  attribute :role, :integer, default: :student
  attribute :status, :integer, default: :not_checked

  scope :instructors, -> { where('role >= 3')}
  scope :instructors_of, -> (modality) { 
    where(role: ['instructor', 'student_and_instructor']).left_joins(:belts).where('belts.color > 4').where('belts.modality' => modality).uniq
  }

  enum role: {
    student: 1,
    open_class_student: 2,
    student_and_instructor: 3,
    instructor: 4
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
    %w[student open_class_student].include?(self.role)
  end

  def pakua_instructor?
    %w[student_and_instructor instructor].include?(self.role)
  end

  def role_br
    if student?
      'Aluno(a)'
    elsif open_class_student?
      'Aluno(a) de aula Inaugural'
    elsif student_and_instructor?
      'Aluno(a) e Instrutor(a)'
    else
      'Instrutor(a)'
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
