# -*- encoding : utf-8 -*-
class CreateProfissionals < ActiveRecord::Migration
  def change
    create_table :profissionals do |t|
      t.references :projeto
      t.string :nome
      t.string :url
      t.text :descricao

      t.timestamps
    end
    add_index :profissionals, :projeto_id
  end
end
