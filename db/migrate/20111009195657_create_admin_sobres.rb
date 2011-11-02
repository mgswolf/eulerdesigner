# -*- encoding : utf-8 -*-
class CreateAdminSobres < ActiveRecord::Migration
  def change
    create_table :admin_sobres do |t|

      t.timestamps
    end
  end
end
