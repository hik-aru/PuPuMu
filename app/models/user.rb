class User < ApplicationRecord
  has_secure_password
  belongs_to :prefecture, optional: true
  has_many :good_lang_relations
  has_many :good_langs, through: :good_lang_relations, source: :program_lang
  has_many :learn_lang_relations
  has_many :learn_langs, through: :learn_lang_relations, source: :program_lang
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  #has_many :program_langs, through: :good_lang_relations
  #has_many(:good_langs, {:through => :good_lang_relations, :source => :program_lang})

  enum gender: { male: 1, female: 2 }

  validates :email,
    { :presence => true,
      :uniqueness => true,
        :length => { :maximum => 16 },
        format: {
        with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
        message: 'が不正な形式です'
        }
    }
  validates :password,
    length: { minimum: 8}

  

end
