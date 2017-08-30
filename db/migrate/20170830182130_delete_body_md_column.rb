class DeleteBodyMdColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :entries, :body_md
  end
end
