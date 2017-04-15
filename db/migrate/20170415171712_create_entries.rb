# frozen_string_literal: true

class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :body
      t.text :body_md
      t.datetime :updated_at
      t.timestamps
    end
  end
end
