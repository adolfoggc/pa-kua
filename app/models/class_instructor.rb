class ClassInstructor < ApplicationRecord
  belongs_to :pakua_class
  belongs_to :person

  validate :person_must_be_an_instructor

  def person_must_be_an_instructor
    unless person.pakua_instructor?
      errors.add(:person, 'Membro deve ser do tipo instrutor')
    end
  end
end
