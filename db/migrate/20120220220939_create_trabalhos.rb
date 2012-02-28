class CreateTrabalhos < ActiveRecord::Migration
  def change
    create_table :trabalhos do |t|
      t.string :titulo
      t.string :url
      t.text :descricao

      t.timestamps
    end
  end
end
