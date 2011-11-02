# -*- encoding : utf-8 -*-
class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.references :sobre
      t.string :imagem_uid
      t.string :imagem_name

      t.timestamps
    end
    add_index :avatars, :sobre_id
  end
end
