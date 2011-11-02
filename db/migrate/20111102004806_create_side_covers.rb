class CreateSideCovers < ActiveRecord::Migration
  def change
    create_table :side_covers do |t|
      t.references :trabalho
      t.string :cover_uid
      t.string :cover_name

      t.timestamps
    end
    add_index :side_covers, :trabalho_id
  end
end
