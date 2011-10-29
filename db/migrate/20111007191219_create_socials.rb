class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.references :sobre
      t.string :nome
      t.string :title
      t.string :url
      t.string :imagem_uid
      t.string :imagem_name

      t.timestamps
    end
    add_index :socials, :sobre_id
  end
end
