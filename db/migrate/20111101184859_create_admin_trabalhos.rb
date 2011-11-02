class CreateAdminTrabalhos < ActiveRecord::Migration
  def change
    create_table :admin_trabalhos do |t|
      t.string :cover_uid
      t.string :cover_name
      t.string :titulo
      t.string :url
      t.string :descricao

      t.timestamps
    end
  end
end
