class Person < ApplicationRecord
  encrypts :name, :address, :cpf, :phone
  encrypts :birthdate, :start_date, type: :date
  blind_index :birthdate, :start_date

  validates :name_ciphertext, :address_ciphertext, :phone_ciphertext, :cpf_ciphertext, :role, presence: true
  validates :start_date, presence: true, if: :pakua_student?

  enum role: {
    student: 1,
    open_class_student: 2,
    student_and_instructor: 3,
    instructor: 4,
    traveling_instructor: 5
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
end
