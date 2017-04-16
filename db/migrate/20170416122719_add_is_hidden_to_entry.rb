class AddIsHiddenToEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :is_hidden, :boolean, null: false
  end
end
