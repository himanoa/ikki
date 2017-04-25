# frozen_string_literal: true

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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_170_418_164_032) do
  create_table 'entries', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'title',                    null: false
    t.text     'body',       limit: 65_535, null: false
    t.text     'body_md',    limit: 65_535, null: false
    t.datetime 'updated_at',               null: false
    t.datetime 'created_at',               null: false
    t.integer  'user_id',                  null: false
    t.boolean  'is_hidden',                null: false
  end

  create_table 'sessions', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'session_id',               null: false
    t.text     'data', limit: 65_535
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index ['session_id'], name: 'index_sessions_on_session_id', unique: true, using: :btree
    t.index ['updated_at'], name: 'index_sessions_on_updated_at', using: :btree
  end

  create_table 'users', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'name'
    t.string   'email'
    t.string   'password_digest'
    t.datetime 'created_at',      null: false
    t.datetime 'updated_at',      null: false
  end
end
