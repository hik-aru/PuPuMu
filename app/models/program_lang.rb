class ProgramLang < ApplicationRecord
  has_many :good_lang_relations
  has_many :good_langs, through: :good_lang_relations, source: :users
  has_many :learn_lang_relations
  has_many :learn_langs, through: :learn_lang_relations, source: :users
end