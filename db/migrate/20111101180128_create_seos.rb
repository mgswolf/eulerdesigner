# -*- encoding : utf-8 -*-
class CreateSeos < ActiveRecord::Migration
  def change
    create_table :seos do |t|
      t.string :title
      t.text :alt
      t.text :description
      t.references :seoable, :polymorphic => true

      t.timestamps
    end
    add_index :seos, :seoable_id
  end
end
