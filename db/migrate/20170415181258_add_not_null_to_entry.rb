# frozen_string_literal: true

class AddNotNullToEntry < ActiveRecord::Migration[5.0]
  def change
    change_column_null :entries, :title, false
    change_column_null :entries, :body, false
    change_column_null :entries, :body_md, false
    change_column_null :entries, :updated_at, false
  end
end
