class AddPasswordDigestToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :password_digest, :string, null: false
  end
end
