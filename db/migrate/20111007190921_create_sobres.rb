class CreateSobres < ActiveRecord::Migration
  def change
    create_table :sobres do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
