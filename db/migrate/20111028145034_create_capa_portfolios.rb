# -*- encoding : utf-8 -*-
class CreateCapaPortfolios < ActiveRecord::Migration
  def change
    create_table :capa_portfolios do |t|
      t.references :projeto
      t.string :descricao
      t.string :cover_uid
      t.string :cover_name

      t.timestamps
    end
    add_index :capa_portfolios, :projeto_id
  end
end
