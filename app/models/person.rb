class Person < ApplicationRecord
  encrypts :name, :address, :birthdate, :cpf, :phone 
  blind_index :birthdate, :start_date

  validates :name_ciphertext, presence: true
  validates :stard_date, presence: true, if: :pakua_student?

  enum role: {
    inactive: -1,
    admin: 0,
    student: 1,
    open_class_student: 2,
    student_and_instructor: 3,
    instructor: 4,
    traveling_instructor: 5
  }

  def pakua_student?
    this.student? || this.student_and_instructor?
  end
end
