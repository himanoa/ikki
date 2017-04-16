# frozen_string_literal: true

class AddUserIdToEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :user_id, :integer, null: false
  end
end
