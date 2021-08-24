class Belt < ApplicationRecord
  belongs_to :person

  enum color: {
    branca: 1,
    amarela: 2,
    laranja: 3,
    verde: 4,
    cinza: 5,
    azul: 6,
    vermelha: 7,
    preta_i: 8,
    preta_ii: 9,
    preta_iii: 10,
    preta_iv: 11,
    preta_v: 12,
    preta_vi: 13,
    preta_vii: 14,
    preta_viii: 15
  }

  enum modality: {
    yoga: 1,
    acrobacia: 2,
    arte_marcial: 3,
    armas_de_corte: 4,
    arqueria: 5,
    tai_chi_pa_kua: 6,
    ritmo: 7
  }
end
