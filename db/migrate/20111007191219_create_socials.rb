# -*- encoding : utf-8 -*-
class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.references :sobre
      t.string :nome
      t.string :title
      t.string :url

      t.timestamps
    end
    add_index :socials, :sobre_id
  end
end
