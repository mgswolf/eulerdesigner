# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111102004806) do

  create_table "admin_sobres", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_trabalhos", :force => true do |t|
    t.string   "cover_uid"
    t.string   "cover_name"
    t.string   "titulo"
    t.string   "url"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "avatars", :force => true do |t|
    t.integer  "sobre_id"
    t.string   "imagem_uid"
    t.string   "imagem_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "avatars", ["sobre_id"], :name => "index_avatars_on_sobre_id"

  create_table "capa_portfolios", :force => true do |t|
    t.integer  "projeto_id"
    t.string   "descricao"
    t.string   "cover_uid"
    t.string   "cover_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "capa_portfolios", ["projeto_id"], :name => "index_capa_portfolios_on_projeto_id"

  create_table "profissionals", :force => true do |t|
    t.integer  "projeto_id"
    t.string   "nome"
    t.string   "url"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profissionals", ["projeto_id"], :name => "index_profissionals_on_projeto_id"

  create_table "projeto_imagems", :force => true do |t|
    t.string   "imagem_uid"
    t.string   "imagem_name"
    t.string   "caption"
    t.string   "descricao"
    t.integer  "projeto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projeto_imagems", ["projeto_id"], :name => "index_projeto_imagems_on_projeto_id"

  create_table "projetos", :force => true do |t|
    t.string   "titulo"
    t.string   "slug"
    t.string   "categoria"
    t.string   "cliente"
    t.text     "descricao"
    t.text     "tecnologia"
    t.string   "ano"
    t.string   "url"
    t.string   "status"
    t.string   "cover_uid"
    t.string   "cover_name"
    t.text     "cover_descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projetos", ["slug"], :name => "index_projetos_on_slug", :unique => true

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seos", :force => true do |t|
    t.string   "title"
    t.text     "alt"
    t.text     "keywords"
    t.text     "description"
    t.integer  "seoable_id"
    t.string   "seoable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seos", ["seoable_id"], :name => "index_seos_on_seoable_id"

  create_table "side_covers", :force => true do |t|
    t.integer  "trabalho_id"
    t.string   "cover_uid"
    t.string   "cover_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "side_covers", ["trabalho_id"], :name => "index_side_covers_on_trabalho_id"

  create_table "sobres", :force => true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "socials", :force => true do |t|
    t.integer  "sobre_id"
    t.string   "nome"
    t.string   "title"
    t.string   "url"
    t.string   "imagem_uid"
    t.string   "imagem_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "socials", ["sobre_id"], :name => "index_socials_on_sobre_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "nome"
    t.string   "email"
    t.string   "slug"
    t.integer  "role_id",            :default => 1
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.integer  "login_count",        :default => 0,  :null => false
    t.integer  "failed_login_count", :default => 0,  :null => false
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "perishable_token",   :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true
  add_index "users", ["role_id"], :name => "index_users_on_role_id"
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

end
