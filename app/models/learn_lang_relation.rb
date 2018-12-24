class LearnLangRelation < ApplicationRecord
  belongs_to :user
  belongs_to :program_lang
end