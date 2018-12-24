class CreateGoodLangRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :good_lang_relations do |t|
      t.integer :user_id
      t.integer :program_lang_id

      t.timestamps
    end
  end
end
