class CreateProjetoImagems < ActiveRecord::Migration
  def change
    create_table :projeto_imagems do |t|
      t.string :imagem_uid
      t.string :imagem_name
      t.string :caption
      t.string :descricao
      t.references :projeto

      t.timestamps
    end
    add_index :projeto_imagems, :projeto_id
  end
end
