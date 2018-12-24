class GoodLangRelation < ApplicationRecord
  belongs_to :user
  belongs_to :program_lang
end