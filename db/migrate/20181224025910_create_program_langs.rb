class CreateProgramLangs < ActiveRecord::Migration[5.2]
  def change
    create_table :program_langs do |t|
      t.string :name

      t.timestamps
    end
  end
end
