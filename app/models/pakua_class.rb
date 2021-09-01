class PakuaClass < ApplicationRecord
  enum day_of_week: {
    domingo: 0,
    segunda: 1,
    terça: 2,
    quarta: 3,
    quinta: 4,
    sexta: 5,
    sabado: 6
  }
end
