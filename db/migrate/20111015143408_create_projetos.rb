# -*- encoding : utf-8 -*-
class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :titulo
      t.string :slug
      t.string :categoria
      t.string :cliente
      t.text :descricao
      t.text :tecnologia
      t.string :ano
      t.string :url
      t.string :status
      t.text :cover_descricao

      t.timestamps
    end
   add_index :projetos, :slug, :unique => true
  end
end

